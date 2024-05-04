import { createSlice, current, isFulfilled, isPending, isRejected, PayloadAction } from '@reduxjs/toolkit';
import type { RootState } from '.';
import {
  moveSlotsReducer,
  refreshSlotsReducer,
  setupInventoryReducer,
  stackSlotsReducer,
  swapSlotsReducer,
} from '../reducers';
import { InventoryType, State } from '../typings';

const initialState: State = {
  leftInventory: {
    id: '',
    type: '',
    slots: 0,
    maxWeight: 0,
    items: [],
  },
  rightInventory: {
    id: '',
    type: '',
    slots: 0,
    maxWeight: 0,
    items: [],
  },
  additionalMetadata: new Array(),
  itemAmount: 0,
  shiftPressed: false,
  isBusy: false,
  showClothing: false,
  clothing: {
    id: 'clothing',
    type: InventoryType.CLOTHING,
    slots: 12,
    items: [
      { name: '', slot: 1 },
      { name: '', slot: 2 },
      { name: '', slot: 3 },
      { name: '', slot: 4 },
      { name: '', slot: 5 },
      { name: '', slot: 6 },
      { name: '', slot: 7 },
      { name: '', slot: 8 },
      { name: '', slot: 9 },
      { name: '', slot: 10 },
      { name: '', slot: 11 },
      { name: '', slot: 12 },
    ],
  },
  takeingAsset: false,
};

export const inventorySlice = createSlice({
  name: 'inventory',
  initialState,
  reducers: {
    stackSlots: stackSlotsReducer,
    swapSlots: swapSlotsReducer,
    setupInventory: setupInventoryReducer,
    moveSlots: moveSlotsReducer,
    refreshSlots: refreshSlotsReducer,
    setAdditionalMetadata: (state, action: PayloadAction<Array<{ metadata: string; value: string }>>) => {
      const metadata = [];

      for (let i = 0; i < action.payload.length; i++) {
        const entry = action.payload[i];
        if (!state.additionalMetadata.find((el) => el.value === entry.value)) metadata.push(entry);
      }

      state.additionalMetadata = [...state.additionalMetadata, ...metadata];
    },
    setItemAmount: (state, action: PayloadAction<number>) => {
      state.itemAmount = action.payload;
    },
    setShiftPressed: (state, action: PayloadAction<boolean>) => {
      state.shiftPressed = action.payload;
    },
    setContainerWeight: (state, action: PayloadAction<number>) => {
      const container = state.leftInventory.items.find((item) => item.metadata?.container === state.rightInventory.id);

      if (!container) return;

      container.weight = action.payload;
    },
    setShowClothing: (state, action: PayloadAction<boolean>) => {
      state.showClothing = action.payload;
    },
    setTakingAsset: (state, action: PayloadAction<boolean>) => {
      state.takeingAsset = action.payload;
    },
  },
  extraReducers: (builder) => {
    builder.addMatcher(isPending, (state) => {
      state.isBusy = true;

      state.history = {
        leftInventory: current(state.leftInventory),
        rightInventory: current(state.rightInventory),
        clothing: current(state.clothing),
      };
    });
    builder.addMatcher(isFulfilled, (state) => {
      state.isBusy = false;
    });
    builder.addMatcher(isRejected, (state) => {
      if (state.history && state.history.leftInventory && state.history.rightInventory) {
        state.leftInventory = state.history.leftInventory;
        state.rightInventory = state.history.rightInventory;
        state.clothing = state.history.clothing;
      }
      state.isBusy = false;
    });
  },
});

export const {
  setAdditionalMetadata,
  setItemAmount,
  setShiftPressed,
  setupInventory,
  swapSlots,
  moveSlots,
  stackSlots,
  refreshSlots,
  setContainerWeight,
  setShowClothing,
  setTakingAsset,
} = inventorySlice.actions;
export const selectLeftInventory = (state: RootState) => state.inventory.leftInventory;
export const selectRightInventory = (state: RootState) => state.inventory.rightInventory;
export const selectItemAmount = (state: RootState) => state.inventory.itemAmount;
export const selectIsBusy = (state: RootState) => state.inventory.isBusy;
export const selectShowClothing = (state: RootState) => state.inventory.showClothing;
export const selectClothing = (state: RootState) => state.inventory.clothing;
export const selectTakingAsset = (state: RootState) => state.inventory.takeingAsset;

export default inventorySlice.reducer;

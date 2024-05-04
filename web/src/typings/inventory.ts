import { Slot } from './slot';

export enum InventoryType {
  PLAYER = 'player',
  SHOP = 'shop',
  CONTAINER = 'container',
  CRAFTING = 'crafting',
  CLOTHING = 'clothing',
}

export type Inventory = {
  id: string;
  type: string;
  slots: number;
  items: Slot[];
  maxWeight?: number;
  label?: string;
  groups?: Record<string, number>;
};

export enum EPedComponent {
  PV_COMP_INVALID = 0xffffffff,
  PV_COMP_HEAD = 0, // "HEAD"
  PV_COMP_BERD = 1, // "BEARD"
  PV_COMP_HAIR = 2, // "HAIR"
  PV_COMP_UPPR = 3, // "UPPER"
  PV_COMP_LOWR = 4, // "LOWER"
  PV_COMP_HAND = 5, // "HAND"
  PV_COMP_FEET = 6, // "FEET"
  PV_COMP_TEEF = 7, // "TEETH"
  PV_COMP_ACCS = 8, // "ACCESSORIES"
  PV_COMP_TASK = 9, // "TASK"
  PV_COMP_DECL = 10, // "DECL"
  PV_COMP_JBIB = 11, // "JBIB"
  PV_COMP_MAX = 12,
}

export const ClothingSlots = [
  1, //'beard',
  3, //'torso',
  4, //'leg',
  6, //'shoes',
  7, //'accessory',
  8, //'undershirt',
  9, //'kevlar',
  10, //'badge',
  11, //'top',
] as const;

export type IClothingSlot = typeof ClothingSlots[number];

export type IClothingInventory = {
  id: 'clothing';
  type: InventoryType.CLOTHING;
  slots: 12;
  items: Slot[];
};

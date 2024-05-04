import React, { useState } from 'react';
import { useDrop } from 'react-dnd';
import { useAppDispatch, useAppSelector } from '../../store';
import { selectItemAmount, selectShowClothing, setItemAmount, setShowClothing } from '../../store/inventory';
import { DragSource } from '../../typings';
import { onUse } from '../../dnd/onUse';
import { onGive } from '../../dnd/onGive';
import { fetchNui } from '../../utils/fetchNui';
import { Locale } from '../../store/locale';
import UsefulControls from './UsefulControls';
import PlayerWeightProgress from './PlayerWeightProgress';
import Line from '../Line';

interface Props {
  infoVisible: boolean;
  setInfoVisible: React.Dispatch<React.SetStateAction<boolean>>;
}

const InventoryControl: React.FC<Props> = ({ infoVisible, setInfoVisible }) => {
  const itemAmount = useAppSelector(selectItemAmount);
  const dispatch = useAppDispatch();
  const showClothing = useAppSelector(selectShowClothing);

  const [, use] = useDrop<DragSource, void, any>(() => ({
    accept: 'SLOT',
    drop: (source) => {
      source.inventory === 'player' && onUse(source.item);
    },
  }));

  const [, give] = useDrop<DragSource, void, any>(() => ({
    accept: 'SLOT',
    drop: (source) => {
      source.inventory === 'player' && onGive(source.item);
    },
  }));

  const inputHandler = (event: React.ChangeEvent<HTMLInputElement>) => {
    event.target.valueAsNumber =
      isNaN(event.target.valueAsNumber) || event.target.valueAsNumber < 0 ? 0 : Math.floor(event.target.valueAsNumber);
    dispatch(setItemAmount(event.target.valueAsNumber));
  };

  return (
    <>
      <UsefulControls infoVisible={infoVisible} setInfoVisible={setInfoVisible} />
      <div className="inventory-control">
        <div className="inventory-control-wrapper">
          <PlayerWeightProgress />
          <div className="w-2/3">
            <Line />
          </div>
          <input
            className="inventory-control-input rounded-xl mt-16 w-40 "
            type="number"
            defaultValue={itemAmount}
            onChange={inputHandler}
            min={0}
          />
          <button
            className="bg-white w-40 h-16 mt-8 rounded-xl text-black font-bold text-1xl uppercase outline-none border-none"
            style={{
              boxShadow: '0 5px 0px 0 rgba(255, 255, 255, 0.5)',
            }}
            ref={use}
          >
            {Locale.ui_use || 'SỬ DỤNG'}
          </button>
          {!showClothing && (
            <button
              className="bg-orange-400 w-40 h-16 rounded-xl text-black font-bold text-1xl uppercase outline-none border-none"
              style={{
                boxShadow: '0 5px 0px 0 rgb(112, 43, 16)',
              }}
              ref={give}
            >
              {Locale.ui_give || 'ĐƯA'}
            </button>
          )}
          {/* <button
            className="bg-red-600 w-40 h-16 rounded-xl text-black font-bold text-1xl uppercase outline-none border-none"
            style={{
              boxShadow: '0 5px 0px 0 rgb(160, 0, 13)',
            }}
            onClick={() => fetchNui('exit')}
          >
            {Locale.ui_close || 'ĐÓNG'}
          </button> */}
          <div className="w-2/3 mt-16">
            <Line />
          </div>
          {!showClothing ? (
            <button
              className="bg-white w-40 h-16 rounded-xl text-black font-bold text-1xl uppercase outline-none border-none"
              style={{
                boxShadow: '0 5px 0px 0 rgb(160, 0, 13)',
              }}
              onClick={() => {
                dispatch(setShowClothing(true));
                fetchNui('openClothing');
              }}
            >
              {Locale.ui_cloth || 'QUẦN ÁO'}
            </button>
          ) : (
            <button
              className="bg-white w-40 h-16 rounded-xl text-black font-bold text-1xl uppercase outline-none border-none"
              style={{
                boxShadow: '0 5px 0px 0 rgb(160, 0, 13)',
              }}
              onClick={() => {
                dispatch(setShowClothing(false));
                fetchNui('closeClothing');
              }}
            >
              {Locale.ui_cloth || 'KHO ĐỒ'}
            </button>
          )}
        </div>
      </div>

      {/* <button className="useful-controls-button" onClick={() => setInfoVisible(true)}>
        <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 524 524">
          <path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336h24V272H216c-13.3 0-24-10.7-24-24s10.7-24 24-24h48c13.3 0 24 10.7 24 24v88h8c13.3 0 24 10.7 24 24s-10.7 24-24 24H216c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z" />
        </svg>
      </button> */}
    </>
  );
};

export default InventoryControl;

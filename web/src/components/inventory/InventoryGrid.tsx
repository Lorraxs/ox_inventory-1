import React, { useEffect, useMemo, useRef, useState } from 'react';
import { Inventory } from '../../typings';
import WeightBar from '../utils/WeightBar';
import InventorySlot from './InventorySlot';
import { getTotalWeight } from '../../helpers';
import { useAppSelector } from '../../store';
import { useIntersection } from '../../hooks/useIntersection';
import NIcon from '../utils/NIcon';
import { Input } from '@nextui-org/react';
import { Text } from 'lr-components';

const PAGE_SIZE = 30;

const InventoryGrid: React.FC<{ inventory: Inventory; playerInventory?: boolean }> = ({
  inventory,
  playerInventory,
}) => {
  const weight = useMemo(
    () => (inventory.maxWeight !== undefined ? Math.floor(getTotalWeight(inventory.items) * 1000) / 1000 : 0),
    [inventory.maxWeight, inventory.items]
  );
  const [page, setPage] = useState(0);
  const containerRef = useRef(null);
  const { ref, entry } = useIntersection({ threshold: 0.5 });
  const isBusy = useAppSelector((state) => state.inventory.isBusy);

  useEffect(() => {
    if (entry && entry.isIntersecting) {
      setPage((prev) => ++prev);
    }
  }, [entry]);
  return (
    <>
      <div className="inventory-grid-wrapper w-1/3 items-center" style={{ pointerEvents: isBusy ? 'none' : 'auto' }}>
        <div className="flex items-center justify-between gap-4 inventory-header">
          <div className="flex items-center gap-2">
            <NIcon />
            <Text fontWeight={'bold'} className="text-lg uppercase" color="#FF8932" textShadow="0 0 40px #FF8932">
              {inventory.label}
            </Text>
          </div>
          <div className="flex  items-center gap-2">
            {inventory.maxWeight && (
              <Text textWrap="nowrap" fontFamily="Oswald">
                <span className="text-sm">{(weight / 1000).toFixed(2)}</span> /{' '}
                <span className="font-bold text-lg text-nowrap">{inventory.maxWeight / 1000} Kg</span>
              </Text>
            )}
            {playerInventory && (
              <Input
                type="text"
                label="Tìm kiếm"
                size="sm"
                variant="flat"
                classNames={{
                  inputWrapper: 'bg-opacity-30',
                }}
                endContent={<i className="icon icon-search"></i>}
              />
            )}
          </div>
        </div>
        {/* <div>
          <WeightBar percent={inventory.maxWeight ? (weight / inventory.maxWeight) * 100 : 0} />
        </div> */}
        <div className="inventory-grid-container" ref={containerRef}>
          <>
            {inventory.items.slice(0, (page + 1) * PAGE_SIZE).map((item, index) => (
              <InventorySlot
                key={`${inventory.type}-${inventory.id}-${item.slot}`}
                item={item}
                ref={index === (page + 1) * PAGE_SIZE - 1 ? ref : null}
                inventoryType={inventory.type}
                inventoryGroups={inventory.groups}
                inventoryId={inventory.id}
              />
            ))}
          </>
        </div>
      </div>
    </>
  );
};

export default InventoryGrid;

import React, { useEffect, useMemo, useRef, useState } from 'react';
import { ICategory, Inventory, InventoryType } from '../../typings';
import WeightBar from '../utils/WeightBar';
import InventorySlot from './InventorySlot';
import { getTotalWeight } from '../../helpers';
import { useAppSelector } from '../../store';
import { useIntersection } from '../../hooks/useIntersection';
import NIcon from '../utils/NIcon';
import { Button, Input } from '@nextui-org/react';
import { Box, Text } from 'lr-components';
import classNames from 'classnames';
import { selectOpenedSlot } from '../../store/inventory';

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
  const [selectedCategory, setSelectedCategory] = useState<ICategory>('all');
  const [searching, setSearching] = useState('');
  const openedSlot = useAppSelector(selectOpenedSlot);

  useEffect(() => {
    if (entry && entry.isIntersecting) {
      setPage((prev) => ++prev);
    }
  }, [entry]);
  return (
    <>
      <Box className="inventory-grid-wrapper gap-4" pointerEvents={isBusy ? 'none' : 'all'}>
        {/* <div className="flex items-center justify-between gap-4 inventory-header">
          <div className="flex items-center gap-2">
            <NIcon />
            <Text
              fontFamily="Oswald"
              className="text-lg uppercase font-normal"
              color="#FF8932"
              textShadow="0 0 40px #FF8932"
            >
              {inventory.label}
            </Text>
          </div>

          <div className="flex  items-center gap-2">
            {inventory.maxWeight && (
              <Text textWrap="nowrap" fontFamily="Oswald" className="min-w-24 text-right">
                <span className="text-xs">{(weight / 1000).toFixed(2)}/</span>{' '}
                <span className="font-normal text-base text-nowrap">{inventory.maxWeight / 1000} Kg</span>
              </Text>
            )}
            {playerInventory && (
              <Input
                type="text"
                label="Tìm kiếm"
                size="sm"
                variant="flat"
                classNames={{
                  inputWrapper: 'bg-opacity-30 h-22 w-36',
                }}
                endContent={<i className="icon icon-search"></i>}
                value={searching}
                onChange={(e) => setSearching(e.target.value)}
              />
            )}
          </div>
        </div> */}
        {/* <div
          className={classNames('filter-wrapper', 'inventory-header', {
            'opacity-0': !playerInventory,
          })}
        >
          <Button
            className={classNames('rounded-md bg-black filter-btn', {
              'bg-orange-400': selectedCategory === 'all',
              'bg-opacity-30': selectedCategory !== 'all',
            })}
            size="sm"
            onClick={() => setSelectedCategory('all')}
          >
            Tất cả
          </Button>
          <Button
            className={classNames('rounded-md bg-black filter-btn', {
              'bg-orange-400': selectedCategory === 'weapon',
              'bg-opacity-30': selectedCategory !== 'weapon',
            })}
            size="sm"
            onClick={() => setSelectedCategory('weapon')}
          >
            Vũ khí
          </Button>
          <Button
            className={classNames('rounded-md bg-black filter-btn', {
              'bg-orange-400': selectedCategory === 'food',
              'bg-opacity-30': selectedCategory !== 'food',
            })}
            size="sm"
            onClick={() => setSelectedCategory('food')}
          >
            Thực phẩm
          </Button>
          <Button
            className={classNames('rounded-md bg-black filter-btn', {
              'bg-orange-400': selectedCategory === 'material',
              'bg-opacity-30': selectedCategory !== 'material',
            })}
            size="sm"
            onClick={() => setSelectedCategory('material')}
          >
            Nguyên liệu
          </Button>
          <Button
            className={classNames('rounded-md bg-black filter-btn', {
              'bg-orange-400': selectedCategory === 'clothing',
              'bg-opacity-30': selectedCategory !== 'clothing',
            })}
            size="sm"
            onClick={() => setSelectedCategory('clothing')}
          >
            Trang phục
          </Button>
        </div> */}
        {/* <div>
          <WeightBar percent={inventory.maxWeight ? (weight / inventory.maxWeight) * 100 : 0} />
        </div> */}
        {inventory.type === InventoryType.PLAYER && (
          <>
            <Text fontFamily="Oswald" rFontSize={18} opacity={0.8}>
              TÚI QUẦN
            </Text>
            <div className="">
              <div className="flex gap-[22px] w-full">
                <InventorySlot
                  item={inventory.items[5]}
                  inventoryType={inventory.type}
                  inventoryGroups={inventory.groups}
                  inventoryId={inventory.id}
                />
                <InventorySlot
                  item={inventory.items[6]}
                  inventoryType={inventory.type}
                  inventoryGroups={inventory.groups}
                  inventoryId={inventory.id}
                />
                <InventorySlot
                  item={inventory.items[7]}
                  inventoryType={inventory.type}
                  inventoryGroups={inventory.groups}
                  inventoryId={inventory.id}
                />
                <InventorySlot
                  item={inventory.items[8]}
                  inventoryType={inventory.type}
                  inventoryGroups={inventory.groups}
                  inventoryId={inventory.id}
                />
                <InventorySlot
                  item={inventory.items[9]}
                  inventoryType={inventory.type}
                  inventoryGroups={inventory.groups}
                  inventoryId={inventory.id}
                />
                <InventorySlot
                  item={inventory.items[10]}
                  inventoryType={inventory.type}
                  inventoryGroups={inventory.groups}
                  inventoryId={inventory.id}
                />
              </div>
            </div>
            <Text fontFamily="Oswald" rFontSize={18} opacity={0.8}>
              BA LÔ
            </Text>
          </>
        )}
        <Box className="inventory-grid-container pr-2" ref={containerRef} rHeight={580}>
          <>
            {inventory.items
              .slice(0, (page + 1) * PAGE_SIZE)
              .map(
                (item, index) =>
                  (inventory.type !== InventoryType.PLAYER || item.slot > 11) && (
                    <InventorySlot
                      searching={searching}
                      selectedCategory={selectedCategory}
                      key={`${inventory.type}-${inventory.id}-${item.slot}`}
                      item={item}
                      ref={index === (page + 1) * PAGE_SIZE - 1 ? ref : null}
                      inventoryType={inventory.type}
                      inventoryGroups={inventory.groups}
                      inventoryId={inventory.id}
                      locked={(inventory.type === InventoryType.PLAYER && item.slot > openedSlot + 11) || false}
                    />
                  )
              )}
          </>
        </Box>
      </Box>
    </>
  );
};

export default InventoryGrid;

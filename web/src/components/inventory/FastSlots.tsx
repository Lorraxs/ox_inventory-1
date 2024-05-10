import React from 'react';
import { useSelector } from 'react-redux';
import { selectLeftInventory } from '../../store/inventory';
import InventorySlot from './InventorySlot';
import { Box, Text } from 'lr-components';

function FastSlots() {
  const leftInventory = useSelector(selectLeftInventory);

  return (
    <div className="flex  h-full items-center relative">
      <div className="fastslot-grid-container">
        {Array.from({ length: 5 }, (_, i) => i).map((i) => {
          return (
            <div className="w-full h-full flex items-end gap-3">
              <InventorySlot
                searching=""
                selectedCategory="all"
                key={i}
                item={leftInventory.items[i]}
                inventoryType={leftInventory.type}
                inventoryGroups={leftInventory.groups}
                inventoryId={leftInventory.id}
              />
              <Box
                rWidth={24}
                rHeight={24}
                className="border-2 border-white border-opacity-30 flex items-center justify-center"
              >
                <Text fontFamily="Oswald" rFontSize={16} rLineHeight={16}>
                  {i + 1}
                </Text>
              </Box>
            </div>
          );
        })}
      </div>
      <Text
        className="text-white text-xs text-center text-nowrap "
        fontFamily="Oswald"
        textTransform="uppercase"
        opacity={0.3}
        rFontSize={18}
        position="absolute"
        writingMode="vertical-rl"
        rRight={-40}
      >
        PHÍM NHANH
      </Text>
    </div>
  );
}

export default FastSlots;

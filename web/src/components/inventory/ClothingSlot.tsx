import { useDrag, useDrop } from 'react-dnd';
import {
  ClothingSlotLabels,
  DragSource,
  IClothingSlot,
  Inventory,
  InventoryType,
  Slot,
  SlotWithItem,
} from '../../typings';
import { getItemUrl, isSlotWithItem } from '../../helpers';
import { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import { useAppDispatch } from '../../store';
import { closeTooltip, openTooltip } from '../../store/tooltip';
import { useMergeRefs } from '@floating-ui/react';
import WeightBar from '../utils/WeightBar';
import { onDrop } from '../../dnd/onDrop';
import { onUseCloth } from '../../dnd/onUseCloth';
import LazyImage from '../utils/LazyImage';
import classNames from 'classnames';
import { useHover } from '@mantine/hooks';
import ItemRarity from './ItemRarity';
import { Box, Text } from 'lr-components';

interface Props {
  slot: IClothingSlot;
  item: Slot;
  inventoryType: Inventory['type'];
}

const ClothingSlot: React.FC<Props> = ({ slot, item, inventoryType }, ref) => {
  const { hovered, ref: hoverRef } = useHover();

  const timerRef = useRef<NodeJS.Timeout | null>(null);
  const [hovering, setHovering] = useState(false);
  const dispatch = useAppDispatch();
  const componentData:
    | {
        componentId: number;
        drawableId: number;
        textureId: number;
        name: string;
        gender: 'male' | 'female';
      }
    | undefined = useMemo(() => {
    if (item.name) {
      //male_component_11_12_0
      const arg = item.name.split('_');
      return {
        gender: arg[0] as 'male' | 'female',
        componentId: Number(arg[2]),
        drawableId: Number(arg[3]),
        textureId: Number(arg[4]),
        name: item.name,
      };
    }
  }, [item]);
  const canDrag = useCallback(() => {
    return true;
  }, [item, inventoryType]);

  const [{ isDragging }, drag] = useDrag<DragSource, void, { isDragging: boolean }>(
    () => ({
      type: 'SLOT',
      collect: (monitor) => ({
        isDragging: monitor.isDragging(),
      }),
      item: () =>
        isSlotWithItem(item, inventoryType !== InventoryType.SHOP)
          ? {
              inventory: inventoryType,
              item: {
                name: item.name,
                slot: item.slot,
              },
              image: item?.name && `url(${getItemUrl(item) || 'none'}`,
            }
          : null,
      canDrag,
    }),
    [inventoryType, item]
  );

  const [{ isOver }, drop] = useDrop<DragSource, void, { isOver: boolean }>(
    () => ({
      accept: 'SLOT',
      collect: (monitor) => ({
        isOver: monitor.isOver(),
      }),
      drop: (source) => {
        dispatch(closeTooltip());
        console.log('drop to clothing', slot, source);
        onUseCloth(source, { inventory: inventoryType, item: { slot: item.slot } });
      },
      canDrop: (source) => {
        console.log('canDrop to clothing', slot, source);
        if (source.inventory !== InventoryType.PLAYER) return false;
        return true;
      },
    }),
    [inventoryType, item]
  );

  const connectRef = (element: HTMLDivElement) => drag(drop(element));
  const refs = useMergeRefs([connectRef, hoverRef]);

  const icon = useMemo(() => {
    if (slot < 12) {
      return `icon-ped-component-${slot}`;
    }
    return `icon-ped-prop-${slot - 12}`;
  }, [slot]);

  return (
    <Box
      ref={refs}
      className="clothing-slot "
      rWidth={88}
      rHeight={88}

      /* style={{
        gridArea: `slot${slot}`,
        border: isOver ? '1px dashed rgba(255,255,255,0.4)' : '',
      }} */
    >
      {!isSlotWithItem(item) && (
        <div className="flex flex-col justify-center items-center">
          <i className={`icon ${icon} slot-icon ${isSlotWithItem(item) ? 'opacity-5' : 'opacity-50'}`} />
          <Text className="text-white text-xs text-center" fontFamily="Oswald" textTransform="uppercase" opacity={0.7}>
            {ClothingSlotLabels[slot]}
          </Text>
        </div>
      )}
      {/* <div
        className="absolute w-full h-full rounded-md"
        style={{
          border: hovering ? '2px solid rgb(254, 137, 49, 1)' : '',
          background: hovering ? 'rgba(254, 137, 49, 0.2)' : '',
        }}
      /> */}
      {/* <div
        className="absolute w-full h-full"
        style={{
          backgroundImage: `url(${item?.name ? getItemUrl(item as SlotWithItem) : 'none'}`,
          backgroundRepeat: 'no-repeat',
          backgroundSize: '6vh',
          backgroundPosition: 'center',
        }}
      ></div> */}
      {componentData && (
        <LazyImage className="w-full h-full absolute" bucket="items" type="component" {...componentData} />
      )}
      {isSlotWithItem(item) && (
        <div
          className="item-slot-wrapper absolute z-10 w-full h-full"
          onMouseEnter={() => {
            timerRef.current = setTimeout(() => {
              dispatch(openTooltip({ item, inventoryType }));
            }, 300);
          }}
          onMouseLeave={() => {
            dispatch(closeTooltip());
            if (timerRef.current) {
              clearTimeout(timerRef.current);
              timerRef.current = null;
            }
          }}
        >
          <div>
            {inventoryType !== 'shop' && item?.durability !== undefined && (
              <WeightBar percent={item.durability} durability />
            )}
          </div>
        </div>
      )}
      <div className="absolute top-0 left-0 w-full h-full flex ">
        <div
          className={classNames('w-2/12 border-t border-l border-b border-white rounded-tl-sm rounded-bl-sm', {
            'border-opacity-30': !hovered,
          })}
        ></div>
        <div
          className={classNames('w-4/12 border-b border-white relative flex justify-center items-center', {
            'border-opacity-30': !hovered,
          })}
        >
          <div className="item-slot-info ">
            <p>{item.count}</p>
          </div>
          {isSlotWithItem(item) && <ItemRarity item={item} />}
        </div>
        <div
          className={classNames('w-6/12 border-b border-r border-t border-white rounded-tr-sm rounded-br-sm', {
            'border-opacity-30': !hovered,
          })}
        ></div>
      </div>
    </Box>
  );
};

export default ClothingSlot;

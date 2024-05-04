import { useAppSelector } from '../../store';
import { selectClothing } from '../../store/inventory';
import { ClothingSlots } from '../../typings';
import ClothingSlot from './ClothingSlot';

const Clothing: React.FC = () => {
  const clothing = useAppSelector(selectClothing);
  return (
    <div className="w-1/3 flex justify-end">
      <div className="clothing-slot-wrapper">
        {ClothingSlots.map((slot) => (
          <ClothingSlot key={slot} slot={slot} item={clothing.items[slot]} inventoryType="clothing" />
        ))}
      </div>
    </div>
  );
};

export default Clothing;

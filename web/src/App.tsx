import InventoryComponent from './components/inventory';
import useNuiEvent from './hooks/useNuiEvent';
import { Items } from './store/items';
import { Locale } from './store/locale';
import { setImagePath } from './store/imagepath';
import { selectTakingAsset, setupInventory } from './store/inventory';
import { Inventory } from './typings';
import { useAppDispatch, useAppSelector } from './store';
import { debugData } from './utils/debugData';
import DragPreview from './components/utils/DragPreview';
import { fetchNui } from './utils/fetchNui';
import { useDragDropManager } from 'react-dnd';
import KeyPress from './components/utils/KeyPress';
import Header from './components/Header';
import Footer from './components/Footer';
import { Text } from 'lr-components';
import Loading from './components/utils/Loading';

debugData([
  {
    action: 'setupInventory',
    data: {
      leftInventory: {
        id: 'playerinventory',
        type: 'player',
        slots: 50,
        label: 'Bob Smith',
        weight: 3000,
        maxWeight: 5000,
        items: [
          {
            metadata: { durability: 100, registered: 'Tri Nguyen', serial: '493906YNB676320', ammo: 0, components: [] },
            stack: false,
            count: 1,
            slot: 5,
            weight: 5130,
            label: 'Pistol',
            close: false,
            name: 'WEAPON_PISTOL',
          },
          { slot: 3, name: 'copper', weight: 100, count: 12, metadata: { type: 'Special' } },
          {
            slot: 4,
            name: 'water',
            weight: 100,
            count: 1,
            metadata: { description: 'Generic item description' },
          },
          { slot: 5, name: 'water', weight: 100, count: 22 },
          {
            slot: 6,
            name: 'backwoods',
            weight: 100,
            count: 1,
            metadata: {
              label: 'Russian Cream',
              imageurl: 'https://i.imgur.com/2xHhTTz.png',
            },
          },
        ],
      },
      rightInventory: {
        id: 'shop',
        type: 'crafting',
        slots: 5000,
        label: 'Bob Smith',
        weight: 3000,
        maxWeight: 5000,
        items: [
          {
            slot: 1,
            name: 'lockpick',
            weight: 500,
            price: 300,
            ingredients: {
              iron: 5,
              copper: 12,
              powersaw: 0.1,
            },
            metadata: {
              description: 'Simple lockpick that breaks easily and can pick basic door locks',
            },
          },
        ],
      },
      clothingItems: [
        {
          slot: 11,
          name: 'male_component_11_100_1',
          weight: 500,
          price: 300,
          ingredients: {
            iron: 5,
            copper: 12,
            powersaw: 0.1,
          },
          metadata: {
            description: 'Simple lockpick that breaks easily and can pick basic door locks',
          },
        },
      ],
    },
  },
]);

const App: React.FC = () => {
  const dispatch = useAppDispatch();
  const manager = useDragDropManager();
  const takeingAsset = useAppSelector(selectTakingAsset);
  useNuiEvent<{
    locale: { [key: string]: string };
    items: typeof Items;
    leftInventory: Inventory;
    imagepath: string;
  }>('init', ({ locale, items, leftInventory, imagepath }) => {
    for (const name in locale) Locale[name] = locale[name];
    for (const name in items) Items[name] = items[name];

    setImagePath(imagepath);
    dispatch(setupInventory({ leftInventory }));
  });

  fetchNui('uiLoaded', {});

  useNuiEvent('closeInventory', () => {
    manager.dispatch({ type: 'dnd-core/END_DRAG' });
  });
  console.log(takeingAsset);
  return (
    <div className="app-wrapper dark">
      <InventoryComponent />
      <DragPreview />
      <KeyPress />
      {takeingAsset && (
        <div
          className="w-full h-full flex items-center justify-center flex-col absolute top-0 left-0 z-50 bg-black bg-opacity-50"
          style={{
            backgroundImage: 'url("https://supabase.lorraxs.dev/storage/v1/object/public/assets/taking-asset-bg.png")',
          }}
        >
          <Loading />
          <Text rFontSize={35} fontFamily="Goldman">
            ĐANG CHỤP HÌNH ...
          </Text>
        </div>
      )}
    </div>
  );
};

addEventListener('dragstart', function (event) {
  event.preventDefault();
});

export default App;

import { Box, Button } from 'lr-components';
import React, { Fragment, useMemo } from 'react';
import Line from './Line';
import { useAppSelector } from '../store';
import { getItemUrl } from '../helpers';
import { SlotWithItem } from '../typings';
import { Items } from '../store/items';
import ClockIcon from './utils/icons/ClockIcon';
import ReactMarkdown from 'react-markdown';
import { Locale } from '../store/locale';

interface Props {
  infoVisible: boolean;
  setInfoVisible: React.Dispatch<React.SetStateAction<boolean>>;
}

function Footer({ infoVisible, setInfoVisible }: Props) {
  const hoverData = useAppSelector((state) => state.tooltip);
  const itemData = useMemo(() => {
    if (!hoverData.item) return null;
    return Items[hoverData.item.name];
  }, [hoverData]);
  const description = hoverData.item?.metadata?.description || itemData?.description;
  const ammoName = itemData?.ammoName && Items[itemData?.ammoName]?.label;
  const additionalMetadata = useAppSelector((state) => state.inventory.additionalMetadata);
  const ingredients = useMemo(() => {
    if (!hoverData.item?.ingredients) return null;
    return Object.entries(hoverData.item.ingredients).sort((a, b) => a[1] - b[1]);
  }, [hoverData]);
  return (
    <div style={{ height: '100%' }} className=" px-16">
      <Box className="w-full">
        <Line />
      </Box>
      <div className="flex  h-full items-center justify-center ">
        <div className="rounded-md bg-white bg-opacity-5  w-1/2">
          {hoverData.open && hoverData.item && (
            <div className="flex items-start p-4 gap-4">
              <div
                className="w-16 h-16 bg-white bg-opacity-25 rounded-md"
                style={{
                  backgroundImage: `url(${hoverData.item?.name ? getItemUrl(hoverData.item as SlotWithItem) : 'none'}`,
                  backgroundRepeat: 'no-repeat',
                  backgroundSize: '70%',
                  backgroundPosition: 'center',
                }}
              />
              <div>
                <h1
                  className="font-bold"
                  style={{
                    textShadow: '0 0 40px #FFFFFF',
                  }}
                >
                  {hoverData.item?.metadata?.label
                    ? hoverData.item?.metadata.label
                    : Items[hoverData.item?.name]?.label || hoverData.item?.name}
                </h1>
                <h5 className="italic text-gray-500">
                  {hoverData.item.weight > 0
                    ? hoverData.item.weight >= 1000
                      ? `${(hoverData.item.weight / 1000).toLocaleString('en-us', {
                          minimumFractionDigits: 2,
                        })}kg `
                      : `${hoverData.item.weight.toLocaleString('en-us', {
                          minimumFractionDigits: 0,
                        })}g `
                    : ''}{' '}
                  {hoverData.inventoryType !== 'crafting' && `x ${hoverData.item.count}`}
                </h5>
                {description && (
                  <div className="tooltip-description">
                    <ReactMarkdown className="text-sm">{description}</ReactMarkdown>
                  </div>
                )}
              </div>
              {hoverData.inventoryType === 'crafting' && (
                <div>
                  <div className="tooltip-crafting-duration">
                    <ClockIcon />
                    <p>{(hoverData.item.duration !== undefined ? hoverData.item.duration : 3000) / 1000}s</p>
                  </div>
                </div>
              )}
              {hoverData.inventoryType !== 'crafting' ? (
                <>
                  {hoverData.item.durability !== undefined && (
                    <p>
                      {Locale.ui_durability}: {Math.trunc(hoverData.item.durability)}
                    </p>
                  )}
                  {hoverData.item.metadata?.ammo !== undefined && (
                    <p>
                      {Locale.ui_ammo}: {hoverData.item.metadata.ammo}
                    </p>
                  )}
                  {ammoName && (
                    <p>
                      {Locale.ammo_type}: {ammoName}
                    </p>
                  )}
                  {hoverData.item.metadata?.serial && (
                    <p>
                      {Locale.ui_serial}: {hoverData.item.metadata.serial}
                    </p>
                  )}
                  {hoverData.item.metadata?.components && hoverData.item.metadata?.components[0] && (
                    <p>
                      {Locale.ui_components}:{' '}
                      {(hoverData.item.metadata?.components).map((component: string, index: number, array: []) =>
                        index + 1 === array.length ? Items[component]?.label : Items[component]?.label + ', '
                      )}
                    </p>
                  )}
                  {hoverData.item.metadata?.weapontint && (
                    <p>
                      {Locale.ui_tint}: {hoverData.item.metadata.weapontint}
                    </p>
                  )}
                  {additionalMetadata.map((data: { metadata: string; value: string }, index: number) => (
                    <Fragment key={`metadata-${index}`}>
                      {hoverData?.item?.metadata && hoverData.item.metadata[data.metadata] && (
                        <p>
                          {data.value}: {hoverData.item.metadata[data.metadata]}
                        </p>
                      )}
                    </Fragment>
                  ))}
                </>
              ) : (
                <div className="grid grid-cols-2">
                  {ingredients &&
                    ingredients.map((ingredient) => {
                      const [item, count] = [ingredient[0], ingredient[1]];
                      return (
                        <div className="tooltip-ingredient" key={`ingredient-${item}`}>
                          <img src={item ? getItemUrl(item) : 'none'} alt="item-image" />
                          <p>
                            {count >= 1
                              ? `${count}x ${Items[item]?.label || item}`
                              : count === 0
                              ? `${Items[item]?.label || item}`
                              : count < 1 && `${count * 100}% ${Items[item]?.label || item}`}
                          </p>
                        </div>
                      );
                    })}
                </div>
              )}
            </div>
          )}
        </div>
        <div className="flex flex-col gap-2 absolute right-20">
          <Button
            label="PHÍM TẮT"
            color="white"
            className=" bg-white bg-opacity-15"
            onClick={() => setInfoVisible(true)}
          ></Button>
        </div>
      </div>
    </div>
  );
}

export default Footer;

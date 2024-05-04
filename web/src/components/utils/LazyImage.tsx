import React, { useEffect, useState } from 'react';
import Loading from './Loading';
import { ICreateAssetPayload } from '../../typings';
import { Sleep, isEnvBrowser } from '../../utils/misc';
import { fetchNui } from '../../utils/fetchNui';
import createAssets from '../../utils/createassets';
import ImageComponent from './Image';
import { useAppDispatch } from '../../store';
import { setTakingAsset } from '../../store/inventory';

type Props = ICreateAssetPayload & { className?: string };

function LazyImage(payload: Props) {
  const [loaded, setLoaded] = useState(false);
  const { name, bucket, className } = payload;
  const dispatch = useAppDispatch();
  useEffect(() => {
    async function fetchImage() {
      /* https://supabase.lorraxs.dev/storage/v1/object/public/vehicles/t20.png */
      const path = `https://supabase.lorraxs.dev/storage/v1/object/public/${bucket}/${name}.png`;
      const img = new Image();
      img.onload = () => {
        setLoaded(true);
      };

      img.onerror = async () => {
        console.log('Error loading image', path);
        dispatch(setTakingAsset(true));
        if (!isEnvBrowser()) {
          /* await Sleep(Math.random() * 1000) */
          const url = await createAssets.add(payload);
          console.log('recieve url', url);
          console.log('Set loaded true');
          setLoaded(true);
        }
        await Sleep(1000);
        setLoaded(true);
        dispatch(setTakingAsset(false));
      };
      img.src = path;
    }
    fetchImage();
    return () => {
      console.log('Cleanup', name);
      setLoaded(false);
    };
  }, [name, bucket, setLoaded]);
  console.log(name, 'Loaded', loaded);
  if (!loaded) return <Loading />;
  return (
    <ImageComponent
      src={`https://supabase.lorraxs.dev/storage/v1/object/public/${bucket}/${name}.png`}
      className={className}
    />
  );
}

export default LazyImage;

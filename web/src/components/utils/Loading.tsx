import React from 'react';
import Lottie from 'react-lottie';
import LoadingAnim from '../../lotties/loading.json';
import { useSelector } from 'react-redux';
import { Box, useWindowSize } from 'lr-components';

function Loading() {
  return (
    <div className="w-full  flex justify-center items-center">
      <Box rWidth={100} rHeight={100}>
        <Lottie
          options={{
            loop: true,
            autoplay: true,
            animationData: LoadingAnim,
            rendererSettings: {
              preserveAspectRatio: 'xMidYMid slice',
            },
          }}
          width={'100%'}
          height={'100%'}
        />
      </Box>
    </div>
  );
}

export default Loading;

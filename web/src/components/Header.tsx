import React from 'react';
import { Box, Text } from 'lr-components';
import Line from './Line';

function Header() {
  return (
    <div className=" bg-opacity-20 flex justify-center items-center px-16 py-8">
      <Box className="w-2/12">
        <Text rFontSize={32} fontWeight={'bold'} color="#fd9347" rLineHeight={32}>
          INVENTORY
        </Text>
        <Text rFontSize={12} fontWeight={600}>
          OF YOUR CHARACTER
        </Text>
      </Box>
      <Box className="w-3/12">
        <Line />
      </Box>
      <Box
        className="self-center w-2/12 text-center"
        backgroundImage={`radial-gradient(
      ellipse 50% 15% at 50% 0%,
        #ffff 0%,
        #fff0 60%
      ),
      radial-gradient(
        ellipse 50% 15% at 50% 100%,
          #ffff 0%,
          #fff0 60%
        )`}
        rPadding={10}
      >
        <Text rFontSize={20} fontWeight={'lighter'} color="white">
          BAODOICITY
        </Text>
      </Box>

      <Box className="w-3/12">
        <Line />
      </Box>
      <Box className="flex items-center gap-2 w-2/12 text-right justify-end">
        <Text rFontSize={14} rLineHeight={14}>
          Exit From
          <br /> Inventory
        </Text>
        <Box className="rounded-md bg-red-600 flex justify-center items-center h-8 w-16 shadow-red-600 shadow-md">
          <Text fontWeight={'bold'} rFontSize={14} color="#1f1f1f">
            ESC
          </Text>
        </Box>
      </Box>
    </div>
  );
}

export default Header;

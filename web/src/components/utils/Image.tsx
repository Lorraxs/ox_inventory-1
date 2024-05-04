import { BoxProps } from 'lr-components/dist/components/Box';
import React from 'react';
import styled from 'styled-components';
import { Box } from 'lr-components';

export type ImageProps = {
  src: string;
  alt?: string;
} & BoxProps;

const StyledImg = styled.img`
  object-fit: contain;
  width: 100%;
  height: 100%;
  object-position: center;
  user-select: none;
`;

const Image = React.forwardRef<HTMLImageElement, ImageProps>((props, ref) => {
  const { src, alt, ...rest } = props;

  return (
    <Box {...rest}>
      <StyledImg
        src={src}
        ref={ref}
        alt={alt || src}
        /* onError={({ currentTarget }) => {
          currentTarget.onerror = null; // prevents looping
          currentTarget.src = './assets/inventory/no-pictures.png';
        }} */
      />
    </Box>
  );
});

export default Image;

import { Box } from 'lr-components';
import React from 'react';

function NIcon() {
  return (
    <Box rWidth={50} rHeight={50} className="flex justify-center items-center">
      <svg width="100%" height="100%" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
        <g clipPath="url(#clip0_7_28)">
          <path
            d="M44.3431 5.65685L5.65685 44.3431C2.53266 47.4673 2.53266 52.5327 5.65685 55.6569L44.3431 94.3431C47.4673 97.4673 52.5327 97.4673 55.6569 94.3431L94.3431 55.6569C97.4673 52.5327 97.4673 47.4673 94.3431 44.3431L55.6569 5.65685C52.5327 2.53266 47.4673 2.53266 44.3431 5.65685Z"
            fill="url(#paint0_linear_7_28)"
            fillOpacity="0.4"
          />
          <path d="M85 15H15V85H85V15Z" stroke="#FF8932" strokeOpacity="0.5" />
          <rect x="14" y="14" width="2" height="2" fill="#FF8932" />
          <rect x="84" y="14" width="2" height="2" fill="#FF8932" />
          <rect x="84" y="84" width="2" height="2" fill="#FF8932" />
          <rect x="14" y="84" width="2" height="2" fill="#FF8932" />
        </g>
        <defs>
          <linearGradient id="paint0_linear_7_28" x1="50" y1="0" x2="50" y2="100" gradientUnits="userSpaceOnUse">
            <stop stopColor="#6F3810" />
            <stop offset="0.5" stopColor="#FF8932" />
            <stop offset="0.5001" stopColor="#FF9243" />
            <stop offset="1" stopColor="#673007" />
          </linearGradient>
          <clipPath id="clip0_7_28">
            <rect width="100" height="100" fill="white" />
          </clipPath>
        </defs>
      </svg>
      <div className="absolute">
        <i
          className="icon icon-beard text-2xl"
          style={{
            color: '#FF9243',
            lineHeight: '0',
          }}
        />
      </div>
    </Box>
  );
}

export default NIcon;

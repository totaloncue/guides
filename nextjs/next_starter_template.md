# NextJS Starter Template for Static + CSR

Required packages and instructions for a starter template using NextJs

## Packages to Install

1. MaterialUI
   1. CSS Baseline

## CSS Methodology

1. Apply direct CSS into Material UI OR
1. Apply styled-components to Material UI
1. Use Tailwind CSS

## Tailwind CSS Starter

1. yarn add tailwindcss
1. yarn add postcss-preset-env
1. yarn add postcss-flexbugs-fixes

### Configuration

Configuration of tailwind.config.js

```javascript
module.exports = {
  future: {
    removeDeprecatedGapUtilities: true,
  },
  purge: ["./components/**/*.{js,ts,jsx,tsx}", "./pages/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      colors: {
        "accent-1": "#333",
      },
    },
  },
  variants: {},
  plugins: [],
};
```

Configuration of postcss.config.js

```javascript
module.exports = {
  plugins: [
    "tailwindcss",
    "postcss-flexbugs-fixes",
    [
      "postcss-preset-env",
      {
        autoprefixer: {
          flexbox: "no-2009",
        },
        stage: 3,
        features: {
          "custom-properties": false,
        },
      },
    ],
  ],
};
```

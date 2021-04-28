# NextJS Starter Template for Static + CSR

Required packages and instructions for a starter template using NextJs

## Tailwind CSS V2 Starter with NextJS 10

[Reference](https://tailwindcss.com/docs/guides/nextjs)

[Canonical Example](https://github.com/vercel/next.js/tree/canary/examples/with-tailwindcss)

1. Initialize NextJS app

With yarn

```shell
yarn create next-app project-name
```

With npm

```shell
npx create-next-app project-name
```

1. Install Tailwind

With Yarn

```shell
yarn add tailwindcss@latest postcss@latest autoprefixer@latest
```

With npm

```shell
npm install -D tailwindcss@latest postcss@latest autoprefixer@latest
```

1. Create Tailwind and PostCSS config files

```shell
npx tailwindcss init -p
```

OR

1. Create tailwind.config.js at project root

```javascript
// tailwind.config.js
module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
};
```

1. Create postcss.config.js at project root

```javascript
// postcss.config.js
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
};
```

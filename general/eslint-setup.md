# ESLint, Prettier and AirBnB Style Guide Setup

Set up and configure ESLint, Prettier and the AirBnB Style Guide

```shell
yarn add --dev eslint@^6.8.0 eslint-plugin-import@^2.20.1 eslint-config-airbnb-base prettier eslint-config-prettier eslint-plugin-prettier
```

```shell
yarn add -D eslint@latest eslint-plugin-import@latest eslint-config-airbnb-base@latest prettier@latest eslint-config-prettier@latest eslint-plugin-prettier@latest
```

## Configuration

.eslintrc.json file as below

```javascript
{
    "env": {
        "commonjs": true,
        "es6": true,
        "node": true,
        "jest": true
    },
    "extends": [
        "airbnb-base",
        "plugin:prettier/recommended"
    ],
    "globals": {
        "Atomics": "readonly",
        "SharedArrayBuffer": "readonly"
    },
    "parserOptions": {
        "ecmaVersion": 2018
    },
    "rules": {
    }
}
```

# Typescript Overview

[Typescript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html)
[Setup Guide](https://khalilstemmler.com/blogs/typescript/node-starter-project/)

## What it is

1. An optional type system on top of Javascript
1. Superset of Javascript
1. Compiles into Javascript flavour of choice

## Setup

1. Add typescript as a development dependency into the project if not globally installed
```shell
npm install typescript --save-dev
```
1. Install support for ambient types
```shell
npm install @types/node --save-dev
```
1. Create tsconfig.json
```shell
npx tsc --init --rootDir src --outDir build \
--esModuleInterop --resolveJsonModule --lib es6 \
--module commonjs --allowJs true --noImplicitAny true
```
1. Compile typescript code
```shell
npx tsc
```

## Terms

1. Definitely Typed?

# Overview of NextJS

## General Overview

1. References

   1. [NextJs Getting Started Guide](https://nextjs.org/learn/basics/create-nextjs-app?utm_source=next-site&utm_medium=homepage-cta&utm_campaign=next-website)
   1. [NextJS docs](https://nextjs.org/docs/getting-started)

1. What is NextJS?

   1. A framework for building websites (and Electron apps?) with React
   1. Can be used for pre-rendered apps and static websites

1. Key Features

   1. Simple page-based routing with support for dynamic routes
   1. Pre-rendering, both static-site-generation(SSG) and server-side rendering (SSR) on a per-page basis
   1. Automatic code splitting
   1. Client-side routing
   1. Built-in CSS and Sass support + support for any CSS-in-JS library
   1. Support for Hot Module Replacement
   1. API routes to build API endpoints with Serverless functions
   1. Fully extendable

1. Dev Environment Setup

   1. Ensure Node 10+ installed
   1. Create an app

   ```shell
   npx create-next-app nextjs-blog --use-npm --example "https://github.com/vercel/next-learn-starter/tree/master/learn-starter"
   ```

   1. Run the dev server to set up a local server at localhost:3000

   ```shell
   cd nextjs-blog
   npm run dev
   ```

1. Pages and Navigation

   1. A page is a React component that is exported from the special pages directory
   1. Pages are associated with a route based on filename

   ```javascript
   export default fucntion FirstPost() {
       return <h1>First Post</h1>
   }
   ```

   1. Use the \<Link> component that wraps \<a> tag in HTML

   ```javascript
   import Link from "next/link";
   <Link href="/">
     <a>Anchor Wording</a>
   </Link>;
   ```

   1. \<Link> enables client-side routing/navigation between pages
   1. Next.js handles code splitting automatically to ensure fast page loads

1. Assets

   1. Static files can be served from the _public_ directory at the top level
      1. Files inside _public_ can be referenced from the root of app similar to _pages_

1. Metadata

   1. Use `<Head>`, a React Component built into Next.js to customize the metadata for any page

   ```javascript
   import Head from "next/head";

   <Head>
     <title>Create Next App</title>
     <link rel="icon" href="/favicon.ico" />
   </Head>;
   ```

1. CSS

   1. Built-in support for [styled-jsx](https://github.com/vercel/styled-jsx)
   1. Can also use other populer CSS-in-JS libs like styled-components and emotion
   1. Support for CSS and Sass
   1. Support for Tailwind
   1. Support for CSS Modules
      1. Create files with format \<componentName>.module.css to store locally scoped css
      1. Import created file into component as _styles_
      1. Use _styles.\<class-name>_ as _className_

1. Global styles

   1. Special file 'app.js' under 'pages'

   ```javascript
   export default function App({ Component, pageProps }) {
     return <Component {...pageProps} />;
   }
   ```

   1. App component becomes the top-level component common across all pages

      1. Use this component to store state

   1. Add global CSS files by importing into '\_app.js'
      1. Cannot import global CSS anywhere else
      1. Can place global CSS file anywhere and use any name
      1. Reco: top-level 'styles' dir with 'global.css' inside

1) Folder structure
   1. pages -- correspond to routes of app/website
      1. Each file in this folder corresponds to a route
      1. public/index.js is \<website_name>/
   1. public

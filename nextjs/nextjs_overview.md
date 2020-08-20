# Overview of NextJS

## References

1. [NextJs Getting Started Guide](https://nextjs.org/learn/basics/create-nextjs-app?utm_source=next-site&utm_medium=homepage-cta&utm_campaign=next-website)
1. [NextJS docs](https://nextjs.org/docs/getting-started)

## What it is

1. A framework for building websites (and Electron apps?) with React
1. Can be used for pre-rendered apps and static websites

## Key Features

1. Simple page-based routing with support for dynamic routes
1. Pre-rendering, both static-site-generation(SSG) and server-side rendering (SSR) on a per-page basis
1. Automatic code splitting
1. Client-side routing
1. Built-in CSS and Sass support + support for any CSS-in-JS library
1. Support for Hot Module Replacement
1. API routes to build API endpoints with Serverless functions
1. Fully extendable

## Dev Environment Setup

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

## Pages and Navigation

1. A page is a React component that is exported from the special pages directory
1. Pages are associated with a route based on filename

```javascript
export default function FirstPost() {
  return <h1>First Post</h1>;
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

## Assets

1. Static files can be served from the _public_ directory at the top level
   1. Files inside _public_ can be referenced from the root of app similar to _pages_

## Metadata

1. Use `<Head>`, a React Component built into Next.js to customize the metadata for any page

```javascript
import Head from "next/head";

<Head>
  <title>Create Next App</title>
  <link rel="icon" href="/favicon.ico" />
</Head>;
```

## CSS

1. Built-in support for [styled-jsx](https://github.com/vercel/styled-jsx)
1. Can also use other popular CSS-in-JS libs like styled-components and emotion
1. Support for CSS and Sass
1. Support for Tailwind
1. Support for CSS Modules
   1. Create files with format \<componentName>.module.css to store locally scoped css
   1. Import created file into component as _styles_
   1. Use _styles.\<class-name>_ as _className_

## Global styles

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
   1. Recommendation: top-level 'styles' dir with 'global.css' inside

## Pre-rendering

1. By default, Next.js pre-renders every page i.e. generates HTML for each page in advance
   1. Can result in better performance and SEO
   1. Minimal JS code needed loaded and runs (hydration)
   1. In contrast, plain React apps are not pre-rendered
1. Static Site Generation (SSG) and Server-side Rendering(SSR) both supported
   1. Per-page choice of SSG vs SSR
   1. SSG generates HTML at build time and serves same HTML for each request
   1. SSR pre-renders HTML on each request

## Data fetching

1. SSG

   1. Static site generation can be with/without data
   1. Some pages depend on fetching external data (e.g. file system, API, database etc.) before they can be rendered
   1. Supported using `getStaticProps`

      1. Each page component can also export an async function called `getStaticProps'
      1. Inside this function, fetch external data and pass as props for the page

      ```javascript
        export default function Home(props) { ... }

        export async function getStaticProps() {
        // Get external data from the file system, API, DB, etc.
        const data = ...

        // The value of the `props` key will be
        //  passed to the `Home` component
        return {
            props: ...
        }
        }
      ```

      1. `getStaticProps` only called server side => safe to call APIs, call database etc

1. SSR

   1. Fetch data at request time instead of at build time
   1. Use `getServerSideProps'

   ```javascript
   export async function getServerSideProps(context) {
     return {
       props: {
         // props for your component
       },
     };
   }
   ```

   1. Use only for pages where data MUST be fetched at request time

1. Client-side rendering
   1. Statically generate parts of the page that do not require external data
   1. When page loads, fetch external data from client using JS and populate page
   1. Works well for any user-specific pages (e.g. dashboards)
      1. Private, user-specific page => SEO not relevant
   1. Also useful for pages where data is frequently updated
   1. Use react hook 'SWR'

## Dynamic Routes

1. Page path depends on external data
   1. Pages that begin with `[` and end with `]` are dynamic pages
   1. Use the `getStaticPaths` function
      1. Function should reside within the relevant page that represents dynamically generated pages
      1. Function should export all possible values of path variable within `[]` in page path
      1. Function can fetch data from any source and it is safe as never exposed to client
   1. Example from Next.js learning starter -- generate pages at path called /posts/\<id> where \<id> is dynamic
      1. Create a page at /pages/posts\[id].js with:
         1. React component to render the page
         1. getStaticPaths which returns an array of possible values of id
         1. getStaticProps which fetches necessary data for the post with id
1. Other topics of note
   1. Fallback
   1. Catch-all routes
   1. 404 Pages
   1. Next Router

## API Routes

1. Create API endpoints as a Node.js function

   1. Create a function inside the 'pages/api' directory with below format:

   ```javascript
   // req = request data, res = response data
   export default (req, res) => {
     // ...
   };
   ```

   1. A function in a file with name 'filename.js' will be accessible at /api/filename

1. Potential Uses

   1. Handling form input

1. The API route's code is NOT part of client bundle => can write safe server-side code

1. API routes can also be dynamic
   1. [Reference on Next.js site](https://nextjs.org/docs/api-routes/dynamic-api-routes)

## Deployment

1. Vercel

   1. Created by Next.js Team
   1. Auto builds and deploys from git repo branches
   1. Pages that use SSG will be auto served from custom Vercel CDN
   1. Pages that use SSR and API routes become isolate Serverless Functions
   1. Supports:
      1. Custom domains
      1. Environment variables
      1. Automatic HTTPS
   1. Develop, Preview and Ship Workflow
      1. Develop
         1. Create a branch, make changes, push to Github and create a new pull request
      1. Preview
         1. Pull request results in Vercel bot creating a 'Preview URL'
      1. Ship
         1. Merge to 'master' to auto-update production build on Vercel

1. On other platforms

   1. Run the 'build' script once on your own hosting server -- this will build the production app in the .next folder

   ```shell
   npm run build
   ```

   1. After building, run the 'start' script to start a Node.js server server running the production app

   ```shell
   npm run start
   ```

   1. The start script can be customized with a port parameter

## Folder structure

1. pages -- correspond to routes of app/website
   1. Each file in this folder corresponds to a route
   1. public/index.js is \<website_name>/
1. public

# Overview of GatsbyJS

## References

1. [Gatsby Docs](https://www.gatsbyjs.org/docs/)

## What It Is

1. Static (and dynamic now?) site generator using React and GraphQL (for the data layer)

## Key Features

## Key Commands

1. gatsby develop
1. gatsby build
1. gatsby serve
1. gatsby info
1. gatsby clean
1. gatsby --help
1. gatsby new
1. gatsby plugin

## Pages and Links

1. Any React component within src/pages/\*.js becomes a page
1. Use the \<Link /> component to create links between pages

## Shared components

1. Put them in a directory called src/components

## Styling

1. Global styles

   1. Typically used for site's typography and background colors
   1. Affect overall feel of the site
   1. Typically stored at src/styles/global.css and imported into gatsby-browser.js

1. Component-scoped CSS with CSS modules

   1. Modularize CSS to apply styling to specific components only
   1. A CSS module is a CSS File in which all class names and animation anmes are locally scoped
   1. Automatically generates unique class and animation names
   1. Gatsby atuo-configured for CSS modules

1. CSS-in-JS

   1. Another component-oriented styling approach
   1. CSS is composed inline using JavaScript
   1. Most popular libs are 'Styled Components' and 'Emotion'

1. Other options

   1. Gatsby supports other styling options also including:

      1. Typography.js
      1. Sass
      1. PostCSS (useful for Tailwind)

## Plugins

1. Javascript packages that help add functionality to a Gatsby site

## Layout Components

## Special files

1. gatsby-browser.js
1. gatsby-config.js

## Best practices

1. Generally, if you use a component in multiple places on a site, it should be in its own module file in the components directory. But, if it’s used only in one file, create it inline

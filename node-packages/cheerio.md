# Overview of Cheerio

## What it is

1. Lean implementation of jQuery
1. Use to parse and manipulate HMTL and XML documents

## Overview

1. Three main types of activity on any HTML document:
   1. Selection
      1. Of specific elements or portions of the document
   1. Traversal
      1. Moving through the document
   1. Manipulation
      1. Modifying the document

## Howto

1. Load some HTML

```javascript
cheerio = require("cheerio");
// const hmtl = some html fragment/document
const $ = cheerio.load(html);
```

### Selectors

1. Nearly identical to jQuery
   1. \$( selector, [context], [root] )
   1. Selector searches within the context scope which searches within the root scope
1. Starting point for traversing and manipulating document

### Attributes

1. Methods for getting and modifying attributes
   1. .attr(name, value)
      1. getting and setting attributes.
   1. .prop( name, value )
      1. getting and setting properties
   1. .data( name, value )
      1. getting and setting data attributes
   1. .val( [value] )
      1. getting and setting the value of input, select, and textarea
   1. .removeAttr( name )
      1. Method for removing attributes by name
   1. .hasClass( className )
      1. Check to see if any of the matched elements have the given className
   1. .addClass( className )
      1. Adds class(es) to all of the matched elements.
   1. .removeClass( [className] )
      1. Removes one or more space-separated classes from the selected elements
   1. .toggleClass( className, [switch] )
      1. Add or remove class(es) from the matched elements
   1. .is( selector )
      1. Checks the current list of elements and returns true if any of the elements match the selector.

### Forms

1. .serializeArray()
   1. Encode a set of form elements as an array of names and values

### Traversing

1. Traverse document or Cheerio list from some starting point
   1. .find(selector)
   1. .parent([selector])
   1. .parents([selector])
   1. .closest(selector)
   1. .next([selector])
   1. .nextAll([selector])
   1. .nextUntil([selector], [filter])
   1. .prev([selector])
   1. .prevAll([selector])
   1. .prevUntil([selector], [filter])
   1. .slice( start, [end] )
   1. .siblings([selector])
   1. .children([selector])
   1. .contents()
   1. .each( function(index, element) )
      1. Iterates over a cheerio object, executing a function for each matched element
   1. .map( function(index, element) )
      1. Pass each element in the current matched set through a function, producing a new Cheerio object containing the return values
   1. .filter( function(index, element) )
      1. Iterates over a cheerio object, reducing the set of selector elements to those that match the selector or pass the function's test.
   1. .not( function(index, elem) )
      1. Remove elements from the set of matched elements.
   1. .has( selector )
   1. .first()
   1. .last()
   1. .eq( i )
   1. .get( [i] )
   1. .index()
   1. .end()
   1. .add( selector [, context] )

### Manipulation

1. Modify the DOM structure
1. .append( content, [content, ...] )
1. .appendTo( target )
1. .prepend( content, [content, ...] )
1. .prependTo( target )
1. .after( content, [content, ...] )
1. .insertAfter( target )
1. .before( content, [content, ...] )
1. .insertBefore( target )
1. .remove( [selector] )
1. .replaceWith( content )
1. .empty()
1. .html( [htmlString] )
1. .text( [textString] )
1. .wrap( content )
1. .css( [properties] )

### Rendering

1. \$.html()
1. \$.xml()
1. \$.text()

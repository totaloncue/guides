# CommanderJS Overview

Build Command Line Interfaces using NodeJS
[Reference](https://github.com/tj/commander.js#commanderjs)

## Installation

```shell
npm install commander
```

## Initialization

```javascript
const { Command } = require("commander");
const program = new Command();
program.version("0.0.1");
```

## Options

1. Use the .option() method, which also serves as documentation
1. Can have a short flag as well as a long name, separated by a comma or space or vertical bar
1. Parse by calling .opts() on a Command object
1. Boolean vs value options (eg. --expect <value>)
   1. Default is undefined

```javascript
program.option(
  "-<small flag>, --<large name> <type>",
  "<description",
  "<default value>"
);
```

## Commands

### Parameters

## F.A.Q.

1. How can a command access options?
1. Is there a concept of global options

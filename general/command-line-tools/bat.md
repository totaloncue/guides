# cat/bat overview

## cat

1. concatenate and print FILEs
1. cat [OPTIONS] [FILE...]
1. read files sequentially and write to standard output

### Options

1. -n: number the output lines
1. -s: squeeze adjacent lines together

### Errors

1. Exit 0 on success, >0 on error

### Gotchas

1. cat file1 file2 > file1 => Data in file1 will be destroyed!

## bat

1. A cat clone with syntax highlighting + Git integration
1. bat [OPTIONS] [FILE]...
1. print syntax-highlighted content of a collection of FILEs to the terminal
1. automatically pipes output through a pager (default: less)
1. When piped, behaviour will default to drop-in replacement of cat

### Options

1. -l --language LANGUAGE
1. -H --highlight-line N:M...: highlight the specified line ranges with a
different bg colour
1. --filename NAME...
1. -d --diff
1. --diff-context NUM
1. --tabs TAB_WIDTH
1. -n --number: only show line numbers
1. --pager COMMAND
1. --theme THEME
1. --list-themse
1. -L --list-languages

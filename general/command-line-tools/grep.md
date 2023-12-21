# grep/egrep/fgrep/grep overview

1. File pattern searcher
1. Recursively searches the current directory for lines matching a pattern
1. grep [OPTIONS] [PATTERN] [FILE...]
1. Searches any given input files, selecting lines that match one OR more patterns
1. PATTERN matches the input line if the regular expression in the pattern
matches the input line without trailing newline
1. PATTERN represents a regular expression used for searching
1. PATH representsa a file or directory to search recursively

## Options

1. Select paths to search:
    1. -R -r --recursive
    1. --exclude pattern: exclude files matching the given filename pattern
    1. --exclude-dir pattern: if -R specified, exclude dirs matching the given pattern
    1. --include pattern: include files matching the given filename pattern
    1. --include-dir pattern: if -R specified, include dirs matching the given pattern
    1. -m --max-count num: stop reading the file after num matches
    1. -S: follow symbolic links if -R specified

1. Define pattern:
    1. -e --regexp pattern: specify a pattern. Use multiple -e options for
    multiple patterns
    1. -i --ignore-case
    1. -E --extended-regexp: force behaviour like egrep
    1. -F --fixed-strings: force behaviour like fgrep
    1. -f --file FILE: read one or emore patterns from FILE
    1. -v --invert-match

1. Display results:
    1. -A --after-context NUM: print num lines of trailing context
    1. -B --before-context NUM: print num lines of leading context
    1. -C --context NUM: print num lines of context
    1. -c --count: only display count of selected lines
    1. -L --files-without-match: print only the names of files without match
    1. -l --files-with-matches: print only the names of files with match
    1. -n --line-number
    1. -o --only-matching: print only matching part of lines
    1. -q --quiet --silent

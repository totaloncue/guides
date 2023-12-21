# ripgrep overview

1. Modern alternative to grep
1. Recursively searches the current directory for lines matching a pattern
1. rg [OPTIONS] PATTERN [PATH...]
1. PATTERN represents a regular expression used for searching
1. PATH representsa a file or directory to search recursively

## Options

1. Select paths to search:
    1. --hidden -. : search hidden files and directories
    1. --ignore-file PATH: specifies a path to one or more .gitignore format
    rules files
    1. -g --glob GLOB: include or exclude files/dirs that match the glob
    1. --max-depth NUM
    1. --max-filesize NUM+SUFFIX?
    1. -L --follow: follow symbolic links

1. Define pattern:
    1. -i --ignore-case
    1. -S --smart-case (default)
    1. -e --regexp PATTERN
    1. -v invert match
    1. -f PATTERNFILE: search for patterns from the PATTERNFILE
    1. -F --fixed-strings: treat the pattern as a literal string

1. Display results:
    1. -n --line-number
    1. -o --only-matching
    1. -p --pretty
    1. -q --quiet
    1. --files: print the files that would be searched without searching
    1. -l --files-with-matches: print the files with at least one match
    1. --files-without-match: print the paths that contain zero matches


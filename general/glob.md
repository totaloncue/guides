# Overview of globbing

1. 'glob'al -- originated in earliest versions of Unix
1. Specify text patterns using wildcard characters
1. Expand a wildcard pattern into the list of matching pathnames

[DigitalOcean glob tool](https://www.digitalocean.com/community/tools/glob?comments=true&glob=%2F%2A%2A%2F%2A.js&matches=false&tests=%2F%2F%20This%20will%20match%20as%20it%20ends%20with%20%27.js%27&tests=%2Fhello%2Fworld.js&tests=%2F%2F%20This%20won%27t%20match%21&tests=%2Ftest%2Fsome%2Fglobs)

## Concepts

1. Traditionally globs do not match hidden dotfiles
1. Relationship with fnmatch()

## Common Wildcards

1. \* = match any number of characters, including none
1. \*\* = recursively match zero or more directories
1. \*(pattern_list) = match zero or one occurrence of any pattern included in list
1. ? = match single character and ignore case
1. [abc] = matches one character in the brackets
1. [a-c] = matches one character from range in brackets
1. [!abc] = match one character that is not included in brackets
1. [!a-z] = match one character that is not in range given in brackets
1. {a,b,c} = match exactly one of the parts of the set
1. !(ab|ce|df) = match anything that does not directly match any of the patterns in parentheses
1. ?(a|b) = zero or one pattern
1. \*(a|b) = zero or more patterns
1. +(a|b) = one or more patterns
1. @(a|b) = exactly one pattern

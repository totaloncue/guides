# Overview of regular expressions

[MDN reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions)

1. Sequence of characters that specifies a search pattern
1. Patterns used to match character combinations in strings

## Key metapatterns

| Metacharacter | Description                                                             |
| ------------- | ----------------------------------------------------------------------- |
| ^             | match the starting position within a string                             |
| .             | match any single character                                              |
| []            | match a single character within brackets <br> use '-' to specify ranges |
| [^ ]          | matches a single character that is NOT contained within brackets        |
| $             | matches the ending position within a string                             |
| ()            | marked subexpression that can be recalled later                         |
| \n (n=1-9)    | matches nth marked subexpression                                        |
| ?             | match the preceding element 0 or 1 times                                |
| \*            | match the preceding element 0 or more times                             |
| +             | match the preceding element 1 or more times                             |
| \|            | choice operator. match either the expression before or after the pipe   |
| {m,n}         | match the preceding element at least m and not more than n times        |

## Character classes

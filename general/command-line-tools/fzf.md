# fzf and fzf-vim overview

1. Command-line fuzzy finder
    1. [Github homepage](https://github.com/junegunn/fzf)
1. Interactive Unix filter for the command line that can be used with any list
1. Default command is 'find * -type f | fzf > selected'
    1. Can be set with env variable FZF_DEFAULT_COMMAND
    1. Consider fd (fd-find) as a modern alternative to find

## Command-line options

1. -m +m multi-select mode
    1. Tab and Shift-Tab to select items
1. -e --exact
1. -i(default) +i (case sensitivity)
1. --height x%
1. --reverse
1. --extended -x (enabled by default)
1. --border --margin=x --padding=y
1. --cycle cyclic scroll
1. --preview=COMMAND

## Use cases

1. [Red Hat Article](https://www.redhat.com/sysadmin/fzf-linux-fuzzy-finder)
1. Search for a file with fzf and open it in Vim
```shell
vim $(fzf)
```
1. Preview file content
```shell
fzf --preview 'bat --color=always {}'
fzf --preview='head -$LINES {}'
```

## Search syntax

1. <word> fuzzy match
1. `<word> exact match
1. ^<word> prefix-exact-match
1. <word>$ suffix-exact-match
1. !<word> inverse-exact-match
1. !^<word> inverse-prefix-exact-match
1. !<word>$ inverse-suffix-exact-match
1. | === OR operator



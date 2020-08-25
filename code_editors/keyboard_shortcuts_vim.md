# Vim keyboard shortcuts

## Movement

1. Character movement
   1. h j k l
1. Token movement
   1. b w B W
1. Beginning and end of line
   1. 0 ^ \$
1. Page Up and Page Down
   1. ctrl+u ctrl+d
   1. ctrl+f ctrl+b
1. Move to specific line number
   1. \<line-number>G
1. Top/middle/bottom
   1. H M L

## Find and replace

1. Search forward
   1. / \<search term>
1. Search backward
   1. ? \<search term>
1. Find the previous/next occurrence of the token under the cursor
   1. \# \*
1. Repeat the last find command forward or backward
   1. n N
1. Replace old with new throughout file
   1. :%s/old/new/g
1. Replace old with new in line
   1. :%s/old/new

## Editing

1. Enter insert mode
   1. i a I A
   1. Capitals move to beginning and end of line
1. Enter insert with new line (forward/backward)
   1. o O
1. Correct
   1. cc
   1. cw cW
   1. ct cf ci ca
1. Delete
   1. dd
   1. dt df di da
   1. dw db etc.
1. Copy/yank
   1. yy
   1. yw yW
1. Paste
   1. p
1. Undo and redo
   1. u
   1. ctrl+r
1. Repeat the last edit command

   1. .

## Special Operators

1. Exclusive match
   1. t\<char>
1. Inclusive match
   1. f\<char>
1. Exclusive inner match
   1. i\<char> => apply to text bounded by \<char>
1. Inclusive inner match
   1. a\<char>

## Folding and unfolding

1. Open a fold
   1. zo
1. Open all folds at cursor
   1. z shift+O
1. Close folds
   1. zc
1. Alternate folds
   1. za

## Visual mode/marking text

1. Start visual mode
   1. v V ctrl+V
1. Exit visual mode
   1. esc
1. Shift left or right
   1. > <
1. Switch case
   1. ~

## Saving and exiting

1. w q wq q!

## Buffers

1. Go to next/prev buffer
   1. :bnext/bprev/bn/bp
      1.s

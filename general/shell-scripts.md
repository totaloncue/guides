# Overview of Shell Scripting Language

[Great Reference](https://www.shellscript.sh/)

## Scope

1. When a shell script is executed, a new terminal is created and script is run within context of that terminal
1. Need to 'source' a script using source or '.' command to make it run within current terminal
1. If running in a new terminal, must use 'export' within script to ensure variables from current terminal are available in newly spawned terminal

## Curly brackets

1. Curly brackets can be used to designate the beginning and end of a variable within some other string

## Fundamental commands

1. echo - print
1. cat - concatenate
1. grep - search
1. chmod - change mode
1. chown - change owner
1. & - run the previous command in the background
1. \ is used to split single-line commands across multiple lines for readability
1. find
   1. Find all files in current directory that have been modified less than 24 hours ago
      1. find . -mtime 0
   1. Find all files in current directory that have been NOT modified in the last 72 hours and display in readable format
      1. find . -type f -mtime +2 -exec ls -lh {} +
   1. Find all files in the current directory that have been modified since a particular date and list in a readable format
      1. find . -type f -newermt 20201214 -exec ls -lh {} +
   1. Delete all files in current directory that have NOT been modified in the last 72 hours
      1. find . -type f -mtime +2 -exec rm {} +
1. touch
1. xargs

## Variables

1. VAR=value
1. The shell does NOT care about type of variables
   1. Everything is stored as a string
1. read VAR
   1. set a variable based on user input
1. unset VAR
   1. unset variable

## Loops

1. for

```shell
for i in 1 2 3 4 5
do
    echo "looping... i is set to $i"
done
```

1. while

```shell
while [ "$INPUT_STRING" != "bye" ]
do
    echo "Please type sthg"
    read INPUT_STRING
    echo "you typed: $INPUT_STRING"
done
```

```shell
while :
do
  echo "Please type something in (^C to quit)"
  read INPUT_STRING
  echo "You typed: $INPUT_STRING"
done
```

## Conditionals/testing

```shell
[ ]
```

```shell
if [ $INPUT_STRING = "hello" ]
then
echo yo yo yo
elif [ $INPUT_STRING = "bye" ]
then
echo bye bye
else
echo no no no
fi
```

```shell
if [ $INPUT_STRING = "hello" ];  then
echo yo yo yo
elif [ $INPUT_STRING = "bye" ]; then
echo bye bye
else
echo no no no
fi
```

### Shorthand syntax

1. Use && for statement to be executed on true and || for statement to be executed on false

```shell
[ $X -ne 0 ] && echo "X isn't zero" || echo "X is zero"
```

### Upgraded commands

[Reference on StackOverflow](https://unix.stackexchange.com/questions/306111/what-is-the-difference-between-the-bash-operators-vs-vs-vs)

# Linux Administration Basics

## Groups

1. Group of users
1. Primary group

## Users

1. Each user is identified by a username
1. Each user owns a private part of the system
1. There is also a special 'superuser' named root who has the privileges to do anything on the system
1. Ordinary users are restricted
   1. Can modify only files that they own
   1. Can run most programs but not all

## Logs

## Package managers

## Filesystem

## Shells

1. Shell builtins vs programs

```shell
type cd
```

1. Wildcards are expanded by the shell before passing to the program

1. Redirect input with < to take input from a file or elsewhere
1. Redirect outpt to a file with > or >> (latter for append only)

1. Redirect errors to a file

```shell
any command 2> errorfile
```

1. Use pipes to redirect standard output of one program to input of another
1. Use the process substitution operator <() to let the output of a program act as a file

1. Use single quotes for literal evaluation
1. Use double quotes for phrase evaluation
1. Use backticks to evaluate contents as a shell command
   1. Same as combination of $(), which can also be nested

## Devices

1. Block
   1. programs access data in fixed chunks
   1. processes can quickly access a random block on the device with the help of kernel
1. Character
   1. work with data streams
   1. can only read and write characters to these devices
1. Pipe/named pipe
   1. like character devices with another process at end of I/O stream, instead of a kernel driver
1. Socket
   1. special-purpose interfaces used for inter-process communication

# Overview of inotify

## What it is

1. Tools to observe/monitor file changes and react to them
2. Two tools included:
   1. inotifywatch
   1. inotifywait

## Installation

```shell
sudo apt install inotify-tools
```

## inotifywait

1. Blocks for inotify events, and can be used in shell scripts
1. -e <Event type>: key events are create, open, modify, delete
1. -r: recursive
1. -q: quiet

```shell
while inotifywait -e modify /var/log/messages; do
    if tail -n1 /var/log/messages | grep httpd; then
    kdialog --msgbox "Apache needs love!"
    fi
done
```

## inotifywatch

[Ubuntu reference](https://manpages.ubuntu.com/manpages/bionic/man1/inotifywatch.1.html)

1. Collects filesytem usage stats and outputs counts of each inotify event

```shell
inotifywatch -v -e access -e modify -e create -e delete -e delete_self -e unmount
inotifywatch -v -z --fromfile <file containing list of files/directories to watch>
```

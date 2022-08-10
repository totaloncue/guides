# QEMU Overview and Useful Commands

## What it is

1. Cross-platfrom emulation program
1. Can also act as a KVM and Xen host where KVM/Xen executes the guest OS and QEMU emulates the hardware

## References 

1. [Good explanation on snapshots and backing files](https://kashyapc.fedorapeople.org/virt/lc-2012/snapshots-handout.html)

## Useful commands

1. Çreate an image 

```shell
qemu-img create -f <format> <image-file-name> <image-file-size>
qemu-img create -f qcow2 fedora-server-base.qcow2 15G
```

1. Convert images between formats

```shell
qemu-img convert -f <format> -O <output-format> $input-file $output-file
```

1. Resize/expand an image

1. Create an image based on a backing file
	1. [QEMU Wiki Reference](https://wiki.qemu.org/Documentation/CreateSnapshot)
	1. Snapshots are images that refer to an original image and use Redirect-On-Write to avoid changing the original image
	1. After creation of the snapshot image file:
		1. VM will be run from the snapshot image rather than the backing file
		1. Any changes to the backing file will corrupt this and any other snapshots based on the backing file

		```shell
		qemu-img create -f qcow2 -b clean-install.qcow2 snapshot.qcow2
		qemu-img create -f <format> -b <original-image-file/backing-file> <snapshot-image-file>
		```
	
1. Get information about an image file, including about full chain of backing files

```shell
qemu-img info --backing-chain snapshot.qcow2
```

1. Create a snapshot

```shell
qemu-img snapshot -c  $snapshot-name $image-name
```

1. Restore a snapshot

```shell
qemu-img snapshot -a $snapshot-name $image-name
```

1. Deleta a snapshot

```shell
qemu-img snapshot -d $snapshot-name $image-name
```

1. Rebase i.e. point image to a new backing file 

```shell
qemu-img rebase -b $new-backing-file $image-file-to-rebase
qemu-img rebase -b new-clean-install.qcow2 snapshot.qcow2
```

1. Commit

```shell
qemu-img commit snapshot.qcow2
```


1. Run an installer from an ISO 

```shell
qemu-system-x86_64 \
  -m 4G \
  -vga virtio \
  -display default,show-cursor=on \
  -usb \
  -device usb-tablet \
  -machine type=q35,accel=hvf \
  -smp 2 \
  -cdrom Fedora-Server-dvd-x86_64-35-1.2.iso \
  -drive file=fedora-server-base.qcow2,if=virtio \
  -cpu host
```

1. Run a VM based on an image file

```shell
qemu-system-x86_64 \
  -m 4G \
  -vga virtio \
  -display default,show-cursor=on \
  -usb \
  -device usb-tablet \
  -machine type=q35,accel=hvf \
  -smp 2 \
  -drive file=fedora-server-base.qcow2,if=virtio \
  -net user,hostfwd=tcp::2222-:22 \
  -net nic \
  -cpu host
```

1. Run a headless VM based on an image file
# Headless
qemu-system-x86_64 \
  -m 4G \
  -display none \
  -usb \
  -device usb-tablet \
  -machine type=q35,accel=hvf \
  -smp 2 \
  -drive file=fedora-1.qcow2,if=virtio \
  -net user,hostfwd=tcp::2222-:22 \
  -net nic \
  -cpu host


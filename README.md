# Noderoot

Noderoot is a tool for chrooting into root file systems stored on a different system.


### How it works
---------------------------------------------------------

- Rootfs path on server: ```/opt/somerootfs```
- Rootfs mount path on node: ```/home/user/rootfs```

1. Using NFS: Shares ```/opt/somerootfs```.
2. Using SSH: connects to the node and brings up the mount using the nfs client at ```/home/user/rootfs```.
3. Using SSH: connects to the node and brings up any additional bind mounts locally such as /proc, /dev, /sys.
4. If a command is given, then using SSH: connects to the node and chroot's into the share and runs the command.
5. If no command given, leaves the mount up and waits for the user to hit Ctrl+C.
6. When complete, brings down the mounts in reverse order and unshares the ```/opt/somerootfs```.


### Why use it?
---------------------------------------------------------

Its mainly an alternative for using qemu user mode emulation.

For example, when building a rootfs for an ARM system the user may want to chroot into the rootfs and
run some compilation steps. This tool allows that to happen on the real CPU that the rootfs will end up living on
rather than an emulated one.


### Server Setup
---------------------------------------------------------

On Debian systems the server needs `nfs-kernel-server`


### Node Setup
---------------------------------------------------------

On Debian systems the node needs `nfs-common`

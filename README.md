devutils
========

Utility scripts for daily life

mkkernel
--------

### Syntax 
    mkkernel <target> [build-options]

mkkernel is for building linux kernel under different build
directory. It automatically makes building directory which
will be ~/kbin/SRCDIR.ARCH.

### Targets
mkkernel accepts kbuild targets and also provides meta targets:

* copyconfig
Copy given(as 2nd param) config file or current kernel
config to .config and run make oldconfig.

* alllog
Build kernel with make.log and error.log

* kinstall
Install kernel and modules as super user

* cscope
Not only build cscope.out but also run cscope afterwards.


kuninstall
----------

### Syntax
     kuninstall [target-kernel-version(s)]

kuninstall helps you to uninstall unneeded kernel and
modules. This removes System.map, initrd.img and vmlinuz
under /boot and removes modules if exist. Afterwards,
update grub entry (currently debian/ubuntu supported)

If you give no arguments, it just prints what the kernel
versions are installed.
Note that the kuninstall doesn't recognize the distro
kernel. So you may need to take care of it.


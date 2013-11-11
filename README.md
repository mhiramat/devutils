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


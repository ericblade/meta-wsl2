Yocto layer for building qemux86{-64} compatible images into a format that can also be run in WSL2.

Add this layer to your Yocto configuration with ```bitbake-layers add-layer```.
Run
```bash
MACHINE=qemuwslx86-64 bitbake (your image name)
```
The -rootfs.tar.gz that results from the build can be directly imported into WSL2 with
```bash
wsl.exe --import (DistroName) (c:\path\to\store\VHDX\file) (path-to-rootfs.tar.gz)
```

After import is complete, you may launch the distro from Windows Terminal, or with
```bash
wsl.exe -D (DistroName)
```

MACHINEs provided:

qemuwslx86{-64}: Can be used to build existing qemux86{-64} image targets. Resets MACHINE to qemux86{-64} after setting necessary flags, so remains compatible with existing image recipes.

wslx86{-64}: Use if your DISTRO wants to supply an image target recipe that specifically targets wsl.  This leaves the MACHINE set to the selected one.

If you use wslx86{-64}, you should be able to get away with building an image with options something like:

PREFERRED_PROVIDER_virtual/kernel = "linux-dummy" # don't bother compiling a kernel
IMAGE_FSTYPES = ".tar.gz" # don't bother with images beyond the -rootfs.tar.gz, you don't need boot files and stuff

These options are not, however, compatible with most image recipes, so for the sake of being able to use existing recipes with no alterations, I have provided the qemu86{-64} MACHINE types as well.



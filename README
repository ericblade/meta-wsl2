Yocto layer for building qemux86{-64} compatible images into a format that can also be run in WSL2.

Add this layer to your Yocto configuration with ```bitbake-layers add-layer```.
Run
```bash
MACHINE=wsl-x86 bitbake (your image name)
```
The -rootfs.tar.gz that results from the build can be directly imported into WSL2 with
```bash
wsl.exe --import (DistroName) (c:\path\to\store\VHDX\file) (path-to-rootfs.tar.gz)
```

After import is complete, you may launch the distro from Windows Terminal, or with
```bash
wsl.exe -D (DistroName)
```


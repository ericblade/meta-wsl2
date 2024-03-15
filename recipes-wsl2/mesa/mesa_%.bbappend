DEPENDS:append:wslx86-64 = " directx-headers"
DEPENDS:append:qemux86-64 = " directx-headers"

PACKAGECONFIG[d3d12] = ""
#PACKAGECONFIG:append:class-target:wslx86-64 = " va d3d12"
#PACKAGECONFIG:append:class-target:qemux86-64 = " va d3d12"

GALLIUMDRIVERS:append:wslx86-64 ="${@bb.utils.contains('PACKAGECONFIG', 'd3d12', ',d3d12', '', d)}"
GALLIUMDRIVERS:append:qemux86-64 ="${@bb.utils.contains('PACKAGECONFIG', 'd3d12', ',d3d12', '', d)}"

PACKAGECONFIG:append:class-target:wslx86-64 = " gallium-llvm"
PACKAGECONFIG:append:class-target:qemux86-64 = " gallium-llvm"
PACKAGECONFIG:append:class-target:wslx86 = " gallium-llvm"
PACKAGECONFIG:append:class-target:qemux86 = " gallium-llvm"

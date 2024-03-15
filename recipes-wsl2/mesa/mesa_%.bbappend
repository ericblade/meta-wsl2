PACKAGECONFIG[d3d12] = ""
#PACKAGECONFIG:append:class-target:wslx86-64 = " va d3d12"
#PACKAGECONFIG:append:class-target:qemux86-64 = " va d3d12"

GALLIUMDRIVERS:append:wslx86-64 ="${@bb.utils.contains('PACKAGECONFIG', 'd3d12', ',d3d12', '', d)}"
GALLIUMDRIVERS:append:qemux86-64 ="${@bb.utils.contains('PACKAGECONFIG', 'd3d12', ',d3d12', '', d)}"

PACKAGECONFIG:append:class-target:wslx86-64 = " va gallium-llvm"
PACKAGECONFIG:append:class-target:qemux86-64 = " va gallium-llvm"
PACKAGECONFIG:append:class-target:wslx86 = " va gallium-llvm"
PACKAGECONFIG:append:class-target:qemux86 = " va gallium-llvm"

DEPENDS:append:wslx86-64 = " ${@bb.utils.contains('PACKAGECONFIG', 'd3d12', 'directx-headers', '', d)}"
DEPENDS:append:qemux86-64 = " ${@bb.utils.contains('PACKAGECONFIG', 'd3d12', 'directx-headers', '', d)}"

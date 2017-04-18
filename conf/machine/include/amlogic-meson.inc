# Amlogic Meson SoCs configurations

MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += " kernel-modules"
MACHINE_EXTRA_RRECOMMENDS += " kernel-devicetree"

SERIAL_CONSOLE = "115200 ttyAM0"

KERNEL_IMAGETYPE = "uImage"
UBOOT_LOADADDRESS = "0x1080000"
UBOOT_ENTRYSYMBOL = "0x1080000"
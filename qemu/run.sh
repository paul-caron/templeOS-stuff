qemu-system-x86_64 -cdrom TOS_Supplemental3.ISO.C -audiodev coreaudio,id=snd0 -machine pcspk-audiodev=snd0 -drive format=raw,file=hardDrive.img -m 512M

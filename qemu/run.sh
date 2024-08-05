qemu-system-x86_64 -audiodev coreaudio,id=snd0 -machine pcspk-audiodev=snd0 -drive format=raw,file=hardDrive.img -m 512M

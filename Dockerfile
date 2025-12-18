FROM debian
WORKDIR /
RUN apt update
RUN apt install qemu-system git
RUN git clone https://github.com/ayunami2000/noVNC
WORKDIR /noVNC
COPY win7.qcow2 /win7.qcow2
RUN chmod +x /noVNC/utils/launch.sh
RUN ./noVNC/utils/launch.sh --listen 80 & qemu-system-x86_64 -vnc :0 -hda ./win7.qcow2 -m 510 -net nic,model=virtio -net user -rtc base=localtime,clock=host -smp cores=4,threads=4 -usbdevice tablet -vga vmware

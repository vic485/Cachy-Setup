# https://gist.github.com/gegehprast/9b212cc84dd209ede2680b5fecdffc4a

# Install requirements
paru -S qemu-full qemu-emulators-full libvirt virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat swtpm

# Enable libvirtd
sudo systemctl enable libvirtd
sudo systemctl start libvirtd

# Add user to libvirt group
sudo usermod -aG libvirt $(whoami)
newgrp libvirt

# Just checking the virtual network
sudo EDITOR=vim virsh net-edit default

# Start and configure autostart for the default network
sudo virsh net-start default
sudo virsh net-autostart default

# Configure firewall_backend on libvirt network config
sudo vim /etc/libvirt/network.conf

# Edit this config, (iptables, nftables, etc)
firewall_backend = "iptables"

# Might be useful
sudo systemctl restart libvirtd

# Start VMM
virt-manager

set -x

rm -f nocloud.iso
genisoimage -output nocloud.iso -volid cidata -joliet -rock user-data meta-data
virsh destroy centos14
virsh undefine centos14
rm -f /home/shankar/KVM/CENTOS/instance1/centos.qcow2
cp /mnt/images/virtimages/templates/CentOS-7-x86_64-GenericCloud.qcow2 /home/shankar/KVM/CENTOS/instance1/centos.qcow2
virt-install --os-type linux \
    --os-variant generic     \
    --name centos14     \
    --ram=1024     \
    --vcpus=1     \
    --cpu host     \
    --disk path=/home/shankar/KVM/CENTOS/instance1/centos.qcow2     \
    --network bridge=virbr1,mac=00:12:22:32:42:33     \
    --network bridge=virbr2,mac=00:13:23:33:43:33     \
    --cdrom nocloud.iso     \
    --console pty,target_type=serial     \
    --graphics none

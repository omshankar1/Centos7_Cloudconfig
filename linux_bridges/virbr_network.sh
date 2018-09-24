virsh net-define virbr1.xml
virsh net-autostart virbr1
virsh net-start virbr1

virsh net-define virbr2.xml
virsh net-autostart virbr2
virsh net-start virbr2

virsh net-define virbr3.xml
virsh net-autostart virbr3
virsh net-start virbr3

#virsh net-create virbr4.xml
virsh net-list --all


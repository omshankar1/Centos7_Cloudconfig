# Centos7_Cloudconfig
Bring up an Centos7 with two interfaces on a KVM environment using CloudInit


1. Creating linux bridges
Running the script virbr_network.sh creates 3 linux bridges like so
```console
shankar@shankar-TP:~/KVM/github/Centos7_Cloudconfig$ virsh net-list --all
 Name                 State      Autostart     Persistent
----------------------------------------------------------
 default              active     yes           yes
 virbr1               active     yes           yes
 virbr2               active     yes           yes
 virbr3               active     yes           yes
```
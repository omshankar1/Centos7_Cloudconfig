# Centos7_Cloudconfig
Bring up an Centos7 with two interfaces on a KVM environment using CloudInit


Creating linux bridges
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

We now have 3 linux bridges, essentially giving us the opportunity to create mulltiple interfaces.
Next step will be to create a Centos7 machine with 2 interfaces
When we start fresh, there would be no virtual machine(vms) existing.

```console
shankar@shankar-TP:~/KVM/CENTOS/instance1$ virsh list --all
 Id    Name                           State
----------------------------------------------------
```

We can use virsh_provisioner.sh to create a Centos7 instance. When the instance comes we should 
be able to login without any password with user 'shankar' and ip address 192.168.1.14 specified
in the user-data.

```console
shankar@shankar-TP:~/KVM/CENTOS/instance1$ ssh shankar@192.168.1.14
Last login: Mon Sep 24 03:37:52 2018 from gateway
[shankar@centos7-test14 ~]$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: ens2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:12:22:32:42:33 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.14/24 brd 192.168.1.255 scope global ens2
       valid_lft forever preferred_lft forever
    inet6 fe80::212:22ff:fe32:4233/64 scope link
       valid_lft forever preferred_lft forever
3: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:13:23:33:43:33 brd ff:ff:ff:ff:ff:ff
    inet 192.168.2.14/24 brd 192.168.2.255 scope global ens3
       valid_lft forever preferred_lft forever
    inet6 fe80::213:23ff:fe33:4333/64 scope link
       valid_lft forever preferred_lft forever
```

If we list all the vms in KVM,

```console
shankar@shankar-TP:~/KVM/CENTOS/instance1$ virsh list --all
 Id    Name                           State
----------------------------------------------------
 5     centos14                       running
```
# How-to-install-GlusterFS
Bash script to install Gluster File System on Debian

## How to Install?

Read blog on  [dev.to]() or  [iCTPro.co.nz]() 

## Security groups

|  Type | Protocol  | Ports  | Source |Description   |
| :------------: | :------------: | :------------: | :------------: |:------------: |
| SSH| SSH   | 22  | Administration Host Security Group   |Administration Host Security Group |
|  Custom TCP Rule  |  TCP | 2007  |  GlusterFS Security Group Secure Transport Server Security Group  | Gluster Daemon |
|  Custom TCP Rule  |TCP   | 111  | GlusterFS Security Group SecureTransport Server Security Group   | Portmapper |
| Custom TCP Rule   |TCP   | 49152-49251   |  GlusterFS Security Group SecureTransport Server Security Group  |Each brick for every volume on your host requires its own port  |
| Custom TCP Rule   | TCP  |  2049  | GlusterFS Security Group SecureTransport Server Security Group    | NFS |

## Basic Installation

SSH into Server 
- You can use [puTTY](https://www.putty.org/)
or For Multi SSH [mRemoteNG](https://mremoteng.org/download)
  
</br>
Get root privilages to run command 

```bash
sudo su -
```

```bash 
wget https://raw.githubusercontent.com/anuvindhs/How-to-install-GlusterFS/main/install.sh
```

```bash 
chmod u+x install.sh
```

```bash 
./install.sh
 ```
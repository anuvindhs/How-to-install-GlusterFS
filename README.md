# How-to-install-GlusterFS
Automated script to install Gluster File System on Debian

![cover](https://res.cloudinary.com/practicaldev/image/fetch/s--LN2xX6nW--/c_imagga_scale,f_auto,fl_progressive,h_420,q_66,w_1000/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/y5137fcz2xzgjzywlvnb.gif)
## How to Install?

Read blog on  [dev.to](https://dev.to/aws-builders/gluster-fs-one-click-install-3b40) or  [iCTPro.co.nz](https://ictpro.co.nz/how-to-create-gluster-fs-on-cloud-day4/) 

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
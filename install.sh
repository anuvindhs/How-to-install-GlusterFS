#!/bin/bash


function update-ubuntu {
            echo -e "\e[1;34m \n  Updating Debian 
#######################################\e[0m"
            echo -e "\e[0m"
            echo -e "\e[1;37m [+] Updating the OS and installing the dependencies\e[0m"
            sudo apt update -y &>> debug.txt 
            sudo apt upgrade -y &>> debug.txt   
            echo -e "  >> Update and Upgrade complete  [\e[1;32mOK\e[1;37m]\e[0m"
}


function get-server-name {
            echo -e "\e[0m"
            echo -e "\e[1;37m [+] Enter a Name for this server or this server domain\e[0m"
            read -p "  >> Server Name:" server_name
            hostnamectl set-hostname $server_name
            echo -e "\e[0m"
            sudo sed -i 's/localhost/$server_name/g' /etc/hosts
            echo -e "\e[1;37m [+] Updating /etc/hosts \e[0m" 
            echo -e "  >> /etc/hosts updated  [\e[1;32mOK\e[1;37m]\e[0m"

}


function install-glusterfs {

        echo -e "\e[1;34m \n  Installing GlusterFS and Dependencies
#######################################\e[0m"
        echo -e "Sit back and relax installing all dependencies  \n\e[0m"

        sudo apt install software-properties-common -y &>> debug.txt | echo -e "\e[1;37m [+] Installing software-properties-common . . . . .\e[0m"
        echo -e "  >> Installed software-properties-common  [\e[1;32mOK\e[1;37m]\e[0m"

        sudo add-apt-repository ppa:gluster/glusterfs-7 -y &>> debug.txt | echo -e "\e[1;37m [+] Adding Gluster repository . . . . .\e[0m"
        echo -e "  >> GlusterFS repository (glusterfs-7) added [\e[1;32mOK\e[1;37m]\e[0m"

        sudo apt-get update -y &>> debug.txt | echo -e "\e[1;37m [+] updating . . . . .\e[0m"
        echo -e "  >> apt update [\e[1;32mOK\e[1;37m]\e[0m"

        sudo apt install glusterfs-server -y &>> debug.txt | echo -e "\e[1;37m [+] Installing GlusterFS server . . . . .\e[0m"
        echo -e "  >> GlusterFS Server installed [\e[1;32mOK\e[1;37m]\e[0m"

        sudo systemctl start glusterd &>> debug.txt | echo -e "\e[1;37m [+] Starting GlusterFS server . . . . .\e[0m"
        echo -e "  >> GlusterFS Server started [\e[1;32mOK\e[1;37m]\e[0m"

        sudo systemctl enable glusterd &>> debug.txt | echo -e "\e[1;37m [+] Enabling GlusterFS server . . . . .\e[0m"
        echo -e "  >> GlusterFS Server enabled [\e[1;32mOK\e[1;37m]\e[0m"

        mkdir -p /glusterfs
        echo -e "\e[1;37m [+] /glusterfs folder Created [\e[1;32mOK\e[1;37m]\e[0m"


}

function debug {
        echo -e "\e[1;34m \n Do you wish to see the debug data?\e[0m"
        echo -e "\e[1;37m [y/n]\e[0m"
        read -p "  >> " debug_data
        if [ $debug_data == "y" ]; then
                echo -e "\e[1;34m \n  Debug data is below: \e[0m"
                cat debug.txt
                echo -e "\e[1;34m \n  End of debug data. \e[0m"
        else
            exit 0
        fi
}   


echo -e "\e[1;32m"

echo "
################################################################################


 ██████╗ ██╗     ██╗   ██╗███████╗████████╗███████╗██████╗       ███████╗███████╗
██╔════╝ ██║     ██║   ██║██╔════╝╚══██╔══╝██╔════╝██╔══██╗      ██╔════╝██╔════╝
██║  ███╗██║     ██║   ██║███████╗   ██║   █████╗  ██████╔╝█████╗█████╗  ███████╗
██║   ██║██║     ██║   ██║╚════██║   ██║   ██╔══╝  ██╔══██╗╚════╝██╔══╝  ╚════██║
╚██████╔╝███████╗╚██████╔╝███████║   ██║   ███████╗██║  ██║      ██║     ███████║
 ╚═════╝ ╚══════╝ ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝      ╚═╝     ╚══════╝
                                                                                 

GlusterFS on Debian
                                     Script Author:  Anuvindh - iCTPro.co.nz
                                     Version: 0.1.0
################################################################################

* The Public IP of EC2 Instances (Assign Elastic IP for production)
* Make sure your Security groups have ports opened as shown below
    22,24007,111,49152-49251,2049 for GlusterFS

 This script will Update Debian, hostname and install GlusterFS
 once the script is complete you can access the you debug.txt file 

################################################################################ \e[0m" 

# ask for user to continue 
echo -e "\n \e[1;37m [+] Press any key to continue or Ctrl+C to exit\e[0m"
read -n 1 -s


get-server-name
update-ubuntu
install-glusterfs

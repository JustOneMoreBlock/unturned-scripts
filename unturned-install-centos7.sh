# Update Nameservers
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf

# Add EPEL Repository
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y update

# Add MONO Repository
yum -y install yum-utils
rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
yum-config-manager --add-repo http://download.mono-project.com/repo/centos/

# Basic Tools
yum -y install wget nano zip unzip mlocate git sudo curl ntpdate screen htop

# Required by Unturned
yum -y install glibc libstdc++ glibc.i686 libstdc++.i686 glibc.i686 libstdc++.i686 mono-devel mono-complete referenceassemblies-pcl ca-certificates mesa-libGL mesa-libGL-devel libXcursor libXrandr-devel gcc-c++ kernel-devel

# Update Time
/usr/sbin/ntpdate -u pool.ntp.org

# Turn Off SELINUX
/sbin/setenforce 0
sed -i 's/SELINUX=enforcing/\ESELINUX=disabled/g' /etc/selinux/config
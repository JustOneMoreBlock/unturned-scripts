# Update Nameservers
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf

# Add EPEL Repository
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y update

# Basic Tools
yum -y install wget nano zip unzip mlocate git sudo curl ntpdate screen htop psmisc net-tools

# Required by Unturned
yum -y install glibc libstdc++ glibc.i686 libstdc++.i686 glibc.i686 libstdc++.i686 ca-certificates mesa-libGL mesa-libGL-devel libXcursor libXrandr-devel gcc-c++ kernel-devel

# Install Older Mono (Hopefully prevents screen from crashing)
# yum -y remove *mono*
mkdir -p /usr/local/src/mono
cd /usr/local/src/mono
wget http://download.mono-project.com/repo/centos/m/mono-core/ibm-data-db2-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/libmono-2_0-1-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/libmono-2_0-devel-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/libmonoboehm-2_0-1-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/libmonoboehm-2_0-devel-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/libmonosgen-2_0-1-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/libmonosgen-2_0-devel-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-complete-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-core-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-data-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-data-oracle-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-data-postgresql-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-data-sqlite-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-devel-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-entityframework-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-extras-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-locale-extras-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-mvc-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-nunit-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-reactive-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-wcf-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-web-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-winforms-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/mono-winfxcore-3.12.1-0.x86_64.rpm
wget http://download.mono-project.com/repo/centos/m/mono-core/monodoc-core-3.12.1-0.x86_64.rpm
rpm -ivh *.rpm
mono --version

# Update Time
/usr/sbin/ntpdate -u pool.ntp.org

# Turn Off SELINUX
/sbin/setenforce 0
sed -i 's/SELINUX=enforcing/\ESELINUX=disabled/g' /etc/selinux/config
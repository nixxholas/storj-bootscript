# Core Packages
apt install -y unzip zip screen apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# .NET Core
wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt update
apt install -y docker-ce docker-ce-cli containerd.io dotnet-sdk-3.1

# Storj Docker Images
docker pull storjlabs/watchtower
docker pull storjlabs/storagenode:beta

# Storj Identity Libs
curl -L https://github.com/storj/storj/releases/latest/download/identity_linux_amd64.zip -o identity_linux_amd64.zip
unzip -o identity_linux_amd64.zip
rm identity_linux_amd64.zip
chmod +x identity_linux_amd64

# Bootstrap the storage identity
./identity_linux_amd64 create storagenode

apt install -y unzip zip curl

curl -L https://github.com/storj/storj/releases/latest/download/identity_linux_amd64.zip -o identity_linux_amd64.zip
unzip -o identity_linux_amd64.zip
rm identity_linux_amd64.zip
chmod +x identity_linux_amd64

./identity_linux_amd64 create storagenode

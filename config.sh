# 安装docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh --mirror Aliyun
# 添加用户'ubuntu' 到 docker用户组
sudo usermod -aG docker ubuntu
echo "请重新登录使新增用户组生效"

# 安装minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
# 运行minikube
minikube start --image-mirror-country='cn' --logtostderr

# 安装golang
wget https://dl.google.com/go/go1.17.7.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.7.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.profile && source .profile

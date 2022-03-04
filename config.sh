# 安装zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y

# 安装docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh --mirror Aliyun

# 添加用户'ubuntu' 到 docker用户组
sudo usermod -aG docker ubuntu
echo "请重新登录使新增用户组生效"

# 安装minikube,kubectl
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# minikube， kubectl auto completion
echo 'source <(minikube completion zsh)' >> $HOME/.zshrc
echo 'source <(minikube kubectl zsh)' >> $HOME/.zshrc

# 运行minikube
minikube start --image-mirror-country='cn' --logtostderr

# 安装golang
wget https://dl.google.com/go/go1.17.7.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.7.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.zshrc && source .zshrc
go env -w GOPROXY=https://goproxy.cn,direct

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo !!! Simple Docker installation task initiated !!!
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum makecache fast
sudo yum install -y docker-ce
sudo systemctl enable docker
sudo systemctl start docker 
echo end of task ! if no errors

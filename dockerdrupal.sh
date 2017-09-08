sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum makecache fast
sudo yum install -y docker-ce
sudo systemctl enable docker
sudo systemctl start docker 
sudo yum install -y epel-release
sudo yum install -y python-pip
sudo pip install --upgrade pip
sudo pip install docker-compose
echo "version: '3.0'

services:
  drupal:
    image: drupal:8.2-apache
    --name: drupal
    ports:
      - 8080:80
    restart: always
    volumes:
      - ./code/modules:/var/www/html/modules
      - ./code/themes:/var/www/html/themes
      - ./data/files:/var/www/html/sites/default/files
      - ./data/private:/var/www/private
    links:
      - mysql

  mysql:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_USER: drupal
      MYSQL_PASSWORD: 123456
      MYSQL_DATABASE: database_name
    restart: always
    volumes:
      - ./data/mysql:/var/lib/mysql
" > docker-compose.yml
sudo docker-compose up -d
docker exec -it drupal8 chown -R www-data:www-data /var/www/html/sites/default/files
echo end of the task

#ENTER YOUR DOCKERHUB USERNAME WHERE IT SAYS yourdockerhubusername

#commit it
sudo docker commit ubuntu-web yourdockerhubusername/ubuntu-webserver:v1

#log into docker
docker login

#added my user to the docker group
sudo usermod -aG docker $USER
newgrp docker

#pushed 
docker push yourdockerhubusername/ubuntu-webserver:v1

#stop and remove original container
docker stop ubuntu-web && docker rm ubuntu-web

#run the pulled image
docker run -dit -p 8080:80 --name ubuntu-web-alt yourdockerhubusername/ubuntu-webserver:v1

#enter the container
docker exec -it ubuntu-web-alt bash

#start apache manually
apachectl start

#exit the container
exit
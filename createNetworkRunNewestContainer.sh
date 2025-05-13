#ENTER YOUR DOCKERHUB USERNAME WHERE IT SAYS yourdockerhubusername

#create network
docker network create custom-net

#run the container using the new network
docker run -dit --name ubuntu-web-net --network custom-net -p 8081:80 yourdockerhubusername/ubuntu-webserver:v1

#verify container is on the network
docker inspect ubuntu-web-net

#go into container
docker exec -it ubuntu-web-net bash

#start apache manually
apachectl start


#exit the ubuntu-web-net container
exit

#stop the ubuntu-web-alt container
docker stop ubuntu-web-alt

#remove the ubuntu-web-alt container
docker rm ubuntu-web-alt
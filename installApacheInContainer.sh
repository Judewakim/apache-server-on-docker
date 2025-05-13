# 1. Update the package index
sudo yum update -y

# 2. Install Docker
sudo amazon-linux-extras install docker -y

# 3. Start the Docker service
sudo service docker start

#run a docker ubuntu container (detached on port 80)
sudo docker run -dit -p 80:80 --name ubuntu-web ubuntu

#go into the container
sudo docker exec -it ubuntu-web bash

#update everything inside the container
apt-get update && apt-get upgrade -y

#install apache
apt-get install apache2 -y

#start apache service
service apache2 start

#exit container
exit

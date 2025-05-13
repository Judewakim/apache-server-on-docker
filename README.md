# 🚀 Docker Apache Web Server

A hands-on project that builds, customizes, and deploys an Apache web server inside a Docker container. This project demonstrates the end-to-end Docker workflow — from container creation and image publishing to multi-container networking on an EC2 instance.

## 📚 Overview

This repo showcases:

- A Dockerized Ubuntu + Apache2 web server
- Custom image creation and publishing to Docker Hub
- EC2 deployment with Docker networking
- Manual service control inside containers
- Troubleshooting Docker login and Apache startup issues

Full write-up and walkthrough available here:  
👉 [Read the article on Medium](https://medium.com/@judewakim/end-to-end-docker-apache-server-build-push-and-networked-deploy-b33b9323da3d?postPublishedType=initial)<br>
👉 [Read the article on Dev.to](https://dev.to/vvakim/end-to-end-docker-apache-server-build-push-and-networked-deploy-gd3)

---

## 🧰 Prerequisites

- An AWS EC2 instance (Amazon Linux 2 recommended)
- Docker installed and running
- Open security group ports: 80, 8080, 8081
- A Docker Hub account

---

## 🚀 Getting Started

### 1. Clone this repository

```bash
git clone https://github.com/yourusername/docker-apache-server.git
cd docker-apache-server
```

### 2. Build the Docker image

```bash
docker build -t yourdockerhubusername/ubuntu-webserver:v1 .
```

### 3. Run the Container

```bash
# Create a Docker network
docker network create custom-net

# Run the container on port 8080
docker run -dit --name ubuntu-web --network custom-net -p 8081:80 yourdockerhubusername/ubuntu-webserver:v1

# Start Apache inside the container
docker exec -it ubuntu-web bash
apachectl start
```
Now navigate to ```http://<your-ec2-ip>:8081``` in your browser

---

## 📦 Pushing to Docker Hub

```bash
# Login
docker login

# Push it
docker push yourdockerhubusername/ubuntu-webserver:v1
```

---

## 🧠 Troubleshooting

| Issue                                     | Solution                                                              |
| ----------------------------------------- | --------------------------------------------------------------------- |
| Apache not running                        | Use `service apache2 start` or `apachectl start` inside the container |
| Docker login “succeeded” but doesn’t work | Add user to Docker group, restart shell, and re-login                 |
| Port not accessible                       | Check EC2 security group — open TCP ports 80, 8080, 8081              |


---

## 📬 Connect with Me

📝 [Medium](https://medium.com/@judewakim)

💼 [LinkedIn](https://linkedin.com/in/jude-wakim)

🐙 [GitHub](https://github.com/Judewakim)

💻 [Dev.to](https://dev.to/vvakim)





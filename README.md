# Docker Apache Web Server

This project demonstrates how to build, customize, and deploy an Apache web server inside a Docker container. It covers the complete Docker workflow—from container creation and image publishing to multi-container networking on an EC2 instance.

## 📀 Project Overview

* Dockerized Ubuntu 20.04 with Apache2
* Custom image creation and publishing to Docker Hub
* EC2 deployment with Docker networking
* Python automation script for building and deploying
* Manual service control inside containers
* Troubleshooting Docker login and Apache startup issues

For a detailed walkthrough, refer to the accompanying article:
[End-to-End Docker: Apache Server Build, Push, and Networked Deploy](https://medium.com/@judewakim/end-to-end-docker-apache-server-build-push-and-networked-deploy-b33b9323da3d)

## 📁 Project Structure

```
.
├── .gitignore
├── .env
├── README.md
├── dockerfile
├── deploy.py
├── commitPushRunPulledImage.sh
├── createNetworkRunNewestContainer.sh
├── installApacheInContainer.sh
└── notes.txt
```

* **`.gitignore`**: Specifies files and directories to be ignored by Git.
* **`.env`**: Contains environment variables (e.g., Docker Hub credentials).
* **`dockerfile`**: Defines the Docker image setup with Ubuntu and Apache2.
* **`deploy.py`**: Python script to automate building, pushing, and deploying the Docker image.
* **Shell Scripts**:

  * **`commitPushRunPulledImage.sh`**: Commits, pushes, and runs the Docker image.
  * **`createNetworkRunNewestContainer.sh`**: Creates a Docker network and runs the latest container.
  * **`installApacheInContainer.sh`**: Installs Apache inside a running container.
* **`notes.txt`**: Contains miscellaneous notes and troubleshooting tips.

## ✨ Getting Started

### Prerequisites

* Docker installed on your local machine or EC2 instance
* Python 3.x installed
* Docker Hub account

### Setup

1. **Clone the repository**:

   ```bash
   git clone https://github.com/Judewakim/apache-server-on-docker.git
   cd apache-server-on-docker
   ```

2. **Configure environment variables**:

   Create a `.env` file in the root directory with the following content:

   ```env
   DOCKER_USERNAME=your_dockerhub_username
   DOCKER_PASSWORD=your_dockerhub_password
   IMAGE_NAME=your_dockerhub_username/apache-server
   IMAGE_TAG=latest
   ```

   *Note: Ensure `.env` is listed in `.gitignore` to prevent sensitive information from being committed.*

3. **Install required Python packages**:

   ```bash
   pip install docker python-dotenv
   ```

### Build and Deploy

* **To build the Docker image, push to Docker Hub, and deploy**:

  ```bash
  python3 deploy.py --build
  ```

* **To deploy using the existing image from Docker Hub**:

  ```bash
  python3 deploy.py
  ```

## 🐳 Dockerfile Overview

The `dockerfile` sets up an Ubuntu 20.04 base image, installs Apache2, and configures it to run in the foreground.

```Dockerfile
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
```

## 🐍 Python Automation Script (`deploy.py`)

The `deploy.py` script automates the following tasks:

* Builds the Docker image (if `--build` flag is provided)
* Logs into Docker Hub using credentials from `.env`
* Pushes the image to Docker Hub
* Creates a Docker network (if not existing)
* Runs the Docker container within the created network

### Usage

```bash
python3 deploy.py [--build]
```

* `--build`: Optional flag to build and push the Docker image before deployment.

## 📝 Troubleshooting

* **Apache Not Starting**: Ensure that Apache is started using `apachectl -D FOREGROUND` as specified in the Dockerfile.
* **Docker Push Denied**: Verify Docker Hub credentials in the `.env` file and ensure you're logged in.
* **Port Not Accessible**: Ensure that port 80 is open in your EC2 instance's security group settings.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

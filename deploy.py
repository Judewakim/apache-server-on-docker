import docker

# Define constants
IMAGE_NAME = "vvakim/apache-server:v1"
CONTAINER_NAME = "apache-container"
NETWORK_NAME = "custom-net"
PORT_BINDING = {'80/tcp': 8080}

# Initialize Docker client
client = docker.from_env()

# Build image
print("Building Docker image...")
image, _ = client.images.build(path=".", tag=IMAGE_NAME)
print(f"Image built: {IMAGE_NAME}")

# Create network if not exists
existing_networks = [n.name for n in client.networks.list()]
if NETWORK_NAME not in existing_networks:
    print(f"Creating Docker network: {NETWORK_NAME}")
    client.networks.create(NETWORK_NAME)
else:
    print(f"Network '{NETWORK_NAME}' already exists.")

# Remove existing container if any
try:
    old_container = client.containers.get(CONTAINER_NAME)
    print("Removing existing container...")
    old_container.stop()
    old_container.remove()
except docker.errors.NotFound:
    pass

# Run container
print("Starting new container...")
container = client.containers.run(
    IMAGE_NAME,
    name=CONTAINER_NAME,
    ports=PORT_BINDING,
    detach=True,
    network=NETWORK_NAME
)

print(f"Container '{CONTAINER_NAME}' is up and running on port 8080.")

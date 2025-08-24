# internal-registry Build Command
DOCKER_BUILDKIT=0 docker build --platform linux/amd64 --no-cache --force-rm -t kior-system-jeus85:latest -f ./DockerFile.jeus ../

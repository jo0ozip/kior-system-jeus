# internal-registry Build Command
DOCKER_BUILDKIT=0 docker build --platform linux/amd64 --no-cache --force-rm -t tmaxsoft-jeus:v8.5 -f ./DockerFile.jeus ../

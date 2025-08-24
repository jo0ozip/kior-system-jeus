# internal-registry Build Command
docker build --platform linux/amd64 --no-cache --force-rm -t tmaxsoft-jeus:v8.5 -f ./DockerFile.jeus ../
#podman build --platform linux/amd64 --no-cache --force-rm -t tmaxsoft-jeus:v8.5 -f ./DockerFile.jeus ../

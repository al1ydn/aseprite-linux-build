# aseprite-linux-build
Create an Aseprite Linux build with a Docker container image.
## Build
Clone this repository.
```
git clone https://github.com/al1ydn/aseprite-linux-build.git
cd aseprite-linux-build/src
```
### Automatic Build
Run the automatic build script.
```
chmod +x build.sh
./build.sh
```
### Manual Build
1. Install Docker
```
sudo apt-get install -y curl
curl -L https://get.docker.io | bash
sudo service docker start
sudo usermod -aG docker $USER
exec sudo --login --user "$USER" /bin/sh -c "cd '$PWD'; exec '$SHELL' -l"
```
2. Build image
```
docker build -t aseprite-linux-build:v1.3.2 .
```
*Or pull [the image from Docker Hub](https://hub.docker.com/r/al1ydn/aseprite-linux-build):*
```
docker pull al1ydn/aseprite-linux-build:v1.3.2
docker tag al1ydn/aseprite-linux-build:v1.3.2 aseprite-linux-build:v1.3.2
```
*Or pull [the image from GitHub Packages](https://github.com/users/al1ydn/packages/container/package/aseprite-linux-build):*
```
docker pull ghcr.io/al1ydn/aseprite-linux-build:v1.3.2
docker tag ghcr.io/al1ydn/aseprite-linux-build:v1.3.2 aseprite-linux-build:v1.3.2
```
3. Create a container
```
docker create --name ase aseprite-linux-build:v1.3.2 null
docker cp ase:/app/bin .
```
4. Launch Aseprite
```
sudo apt-get install -y ffmpeg libsm6 libxext6 libc++-dev
./bin/aseprite
```
# Docker container with sshd

Base Docker images is centos:6
[Docker Hub Registry](https://registry.hub.docker.com/u/nishik20/centos-sshd/)

## Build
`$ docker build -t nishik20/centos-sshd .`

## Usage
```
$ docker run -d -p 2222:22 nishik20/centos-sshd
$ ssh -p 2222 docker@localhost
```

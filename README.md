centos-sshd
===========

Docker container with sshd server

* Prepare
```
$ vagrant up
$ vagrant ssh
$ sudo yum install docker-io
$ sudo gpasswd -a vagrant docker
$ sudo /sbin/service docker restart
--> relogin
$ cp /vagrant/Dockerfile .
```

* Build
`[vagrant@localhost ~]$ docker build -t nishik20/centos-sshd .`

* Run
`[vagrant@localhost ~]$ docker run -d -p 0.0.0.0:2222:22 nishik20/centos-sshd`

* SSH to container
```
[vagrant@localhost ~]$ ssh -p 2222 docker@localhost
docker@localhost's password:
Last login: Sun Apr 13 03:45:40 2014 from 172.17.42.1
[docker@b8f7a5e86290 ~]$
```

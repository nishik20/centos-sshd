FROM centos

RUN yum update -y
RUN yum install -y passwd
RUN yum install -y openssh
RUN yum install -y openssh-server
RUN yum install -y openssh-clients
RUN yum install -y sudo

# sshd setup 
RUN sed -i s/"session    required     pam_selinux.so close"/"#session    required     pam_selinux.so close"/g /etc/pam.d/sshd
RUN sed -i s/"session    required     pam_loginuid.so"/"#session    required     pam_loginuid.so"/g /etc/pam.d/sshd
RUN sed -i s/"session    required     pam_selinux.so open env_params"/"#session    required     pam_selinux.so open env_params"/g /etc/pam.d/sshd
RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop

# user setup 
RUN echo 'root:docker' | chpasswd
RUN useradd docker
RUN echo 'docker:docker' | chpasswd
RUN echo "docker    ALL=(ALL)       ALL" >> /etc/sudoers.d/docker
RUN chmod 644 /etc/sudoers.d/docker

# sshd start
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

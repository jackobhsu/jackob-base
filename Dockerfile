FROM centos:latest 

MAINTAINER jackob hsu

RUN yum -y install wget openssh-server.x86_64 net-tools epel-release

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz -O /opt/jdk-8u45-linux-x64.tar.gz && \
	tar xfv /opt/jdk-8u45-linux-x64.tar.gz -C /opt && \
	ln -s /opt/jdk1.8.0_45 /opt/java 

ENV JAVA_HOME /opt/java 
ENV PATH /opt/java/bin:$PATH

RUN ssh-keygen -A

#RUN ssh-keygen -t rsa -b 4096 -P '' -f /etc/ssh/ssh_host_rsa_key
#RUN ssh-keygen -t dsa -b 1024 -P '' -f /etc/ssh/ssh_host_dsa_key

RUN echo 'root:520jackob@' | chpasswd
#RUN mkdir /var/run/sshd
RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config


EXPOSE 22 

CMD ["/usr/sbin/sshd", "-D"] 



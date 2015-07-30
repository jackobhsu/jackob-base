FROM centos:latest 

MAINTAINER jackob hsu

RUN yum -y install wget

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz -O /opt/jdk-8u45-linux-x64.tar.gz && \
	tar xfv /opt/jdk-8u45-linux-x64.tar.gz -C /opt && \
	ln -s /opt/jdk1.8.0_45 /opt/java 

ENV JAVA_HOME /opt/java 
ENV PATH /opt/java/bin:$PATH


EXPOSE 22 

CMD ["/usr/sbin/sshd", "-D"] 



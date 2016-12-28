FROM ubuntu
MAINTAINER Forly Macias

# Install Essentials
#RUN apt-get update && apt-get clean all

#Install packages
RUN apt-get update && apt-get install -y \
 git \
 openssh-server \
 sudo \
 wget \
&& /usr/bin/ssh-keygen -A \
&& useradd jenkins -m -s /bin/bash \
&& mkdir /home/jenkins/.ssh \
&& chown -R jenkins /home/jenkins \
&& chgrp -R jenkins /home/jenkins \
&& chmod 755 /usr/sbin/sshd \
&& mkdir -p /var/run/sshd \
&& echo "jenkins  ALL=(ALL)  ALL" >> etc/sudoers

#RUN /usr/bin/ssh-keygen -A

RUN sed -ri 's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' /etc/pam.d/sshd

#RUN useradd jenkins -m -s /bin/bash

#RUN mkdir /home/jenkins/.ssh
#COPY files/authorized_keys /home/jenkins/.ssh/authorized_keys
#RUN chown -R jenkins /home/jenkins
#RUN chgrp -R jenkins /home/jenkins
#RUN chmod 600 /home/jenkins/.ssh/authorized_keys
#RUN chmod 700 /home/jenkins/.ssh
#RUN chmod 755 /usr/sbin/sshd
# Add the jenkins user to sudoers
#RUN echo "jenkins  ALL=(ALL)  ALL" >> etc/sudoers
# Set Name Servers
COPY files/resolv.conf /etc/resolv.conf

# Expose SSH port and run SSHD
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
#CMD echo Hello

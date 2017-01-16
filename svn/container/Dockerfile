FROM alpine:latest
MAINTAINER infraestructuras@grupogodo.com

ENV BASEPATH ""
ENV LDAP_CONFIG_VERBOSE "1"
ENV LDAP_READ_DN ""
ENV LDAP_WRITE_DN ""
ENV LDAP_HOST ""
ENV LDAP_DOMAIN ""
ENV LDAP_BASE ""
ENV LDAP_USER_BASE ""
ENV LDAP_GROUP_BASE ""
ENV LDAP_URL ""
ENV LDAP_URL_QUERY "?uid?sub?(objectClass=posixAccount)"
ENV LDAP_BIND_DN ""
ENV LDAP_BIND_PWD ""
ENV LDAP_MEMBER_UID "memberUid"
ENV LDAP_GROUP_ATTR_IS_DN "off"


# Install and configure Apache WebDAV and Subversion
RUN apk --no-cache add apache2 \
apache2-utils \
apache2-webdav \
libapache2-mod-svn \
libapache2-mod-perl2 \
libnet-ldap-perl \
libapache2-mod-macro \
mod_dav_svn \
subversion \
&& mkdir -p /run/apache2

RUN a2enmod dav_svn ldap authnz_ldap perl macro
ADD conf/svn.conf /etc/apache2/conf-available/svn.conf
RUN a2enconf svn

VOLUME /svn

EXPOSE 80

ADD conf/start.sh /start.sh
# Define default command
CMD ["/start.sh"]


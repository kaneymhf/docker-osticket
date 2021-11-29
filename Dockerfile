FROM centos:7

LABEL Maintainer="Maykon Facincani <facincani.maykon@gmail.com>"
LABEL Description="Osticket Container Apache 2.4 & PHP 7.4 based on CentOS Linux."

RUN curl 'https://setup.ius.io/' | sh 

RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm 
RUN yum -y install epel-release yum-utils

RUN yum-config-manager --enable remi-php74

RUN yum -y install \
		mod_php \
		php-cli \
		php-mysqlnd

RUN yum -y install \
		bzip2 \
		httpd mod_ssl \
	        php-common \
		php-json \
		php-mbstring \
		php-mysqli \
		php-session \
		php-gd \
		php-curl \
		php-domxml \
		php-imap \
		php-ldap \
		php-openssl \
		php-opcache \
		php-apcu \
		php-xmlrpc \
		php-intl \
	        php-pecl-apcu \
		php-snmp \
		php-soap \
		openssl \
		jq \
		zip \
		zlib \
		zlib-devel \
		php-pear-CAS \
		php-pear \
		php-devel \
		php-pecl-zip \
		httpd-devel \ 
		pcre-devel \ 
		gcc \ 
		make \
		wget \
	&& yum -y clean all \
	&& rm -rf /var/cache/yum

ADD php.d /etc/php.d

ADD conf.d /etc/httpd/conf.d

COPY main.sh /root/main.sh
COPY .htaccess /root/.htaccess

RUN chmod 755 /root/main.sh

EXPOSE 80/tcp 443/tcp

CMD ["/root/main.sh"]

HEALTHCHECK --interval=5s --timeout=3s CMD curl --fail http://localhost:80/osticket || exit 1

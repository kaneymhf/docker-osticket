#!/bin/bash
#
set -x
#

RUN chown apache:apache -R /var/www/html/osticket

RUN find /var/www/html/osticket/ -type f -exec chmod 644 {} \; 
RUN find /var/www/html/osticket/ -type d -exec chmod 775 {} \; 

/usr/sbin/httpd -DFOREGROUND

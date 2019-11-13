#!/usr/bin/env bash

# installation notes from:
# https://askubuntu.com/questions/800216/installing-ubuntu-16-04-lts-how-to-install-odbc

# https://dev.mysql.com/get/Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.18-linux-ubuntu18.04-x86-64bit.tar.gz

# MySQL Community Downloads page:
# https://dev.mysql.com/downloads/connector/odbc/
# choose your os and version and download the tar file

set -e
set -x

wget --progress=bar:force https://dev.mysql.com/get/Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.18-linux-ubuntu18.04-x86-64bit.tar.gz -O mysql_connector.tgz

mkdir -p /tmp/mysql_connector
tar xvzf mysql_connector.tgz -C /tmp/mysql_connector --strip 1

mv /tmp/mysql_connector/lib/libmyodbc*.so /usr/lib/x86_64-linux-gnu/odbc/.

rm -rf \
    /tmp/mysql_connector \
    mysql_connector.tgz


# add this to the end of /etc/odbcinst.ini
#[MySql]
#Description=ODBC for MySQL
#Driver=/usr/lib/x86_64-linux-gnu/odbc/libmyodbc8a.so
#Setup = /usr/lib/x86_64-linux-gnu/odbc/libodbcmyS.so
#FileUsage = 1


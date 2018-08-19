This repository setups Wordpress from version 3.2 to version 4. It is used as honeypot to gather log to `fluentd` & `MangoDB`. Fluentd and MongoDB are built in separate git repository.

There are two sub folders: `wp3` and `wp4` which store respectively Dockerfiles for Wordpress 3 and Wordpress 4.

# Wordpress 3

Wordpress 3 uses MySQL 5.5 and PHP 5.6 but with a wrapper of mysqli for older php mysql `MYSQL_*` functions which are deprecated, thanks to the [MySQLi database layer](https://wordpress.org/plugins/mysqli "")

Only Wordpress 3.2 and above are supported due to the absence of older php version and MySQL version.

The Dockerfile uses Dockerfile build from the official [Docker Wordpress project](https://github.com/docker-library/wordpress "") with some minor modification to include `mysqli` plugin.

# Wordpress 4


This repository setups Wordpress from version 3.2 to 3.9 branches and 4 branches. It is used as honeypot to gather access and error logs to `fluentd` & `MangoDB`. Fluentd and MongoDB are built in a separate git repository.

There are two sub folders: `wp3` and `wp4` which store respectively Dockerfiles for Wordpress 3 and Wordpress 4.

# Wordpress 3

Wordpress 3 uses MySQL 5.5 and PHP 5.6 but with a wrapper of mysqli for older php mysql `MYSQL_*` functions which are deprecated, thanks to the [MySQLi database layer](https://wordpress.org/plugins/mysqli "").

Only Wordpress 3.2 until 3.9 are supported due to the absence of older php version and MySQL version.

The Dockerfile uses Dockerfile build from the official [Docker Wordpress project](https://github.com/docker-library/wordpress "") with some minor modifications to include `mysqli` plugin.

To build and run images:
- Copy `docker-compose.example.yml` to `docker-compose.yml`
- Run `docker-compose build`
- Setup usernames/passwords for each Wordpress containers in the environment file. Copy the file `env-example` to `.env`
- Run shell script `run.sh` which will generate SQL script to create all `database name`, `database user` and `database password` in folder `credentials`.
- Run `docker-compose up`
- Each container is given port range from `9100-`
- Make sure the file in `data` is writable from the containers.

# Wordpress 4

In WP4, we deploy these Wordpress versions:

- `4.0.24`
- `4.1.2`
- `4.3.1`
- `4.4.2`
- `4.5.3`
- `4.6.1`
- `4.7.5`
- `4.8.0`
- `4.8.3`
- `4.9.0`
- `4.9.8`

These containers are accessible via ports from `9200-`, check `docker-compose.example.yml` for detail.
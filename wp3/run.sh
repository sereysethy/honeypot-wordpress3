#!/bin/bash

ENV_FILE=".env"
OUTPUT_FILE="./credentials/create_users_db.sql"
WP="32 33 34 35 36 37 38 3827"

# clean up
rm $OUTPUT_FILE

# load env variables
for e in `cat $ENV_FILE`
do
  export $e
done

# create user/password for each container list in WP

for i in $WP
do 
  db_name=DB_NAME_${i}
  db_user=DB_USER_${i}
  db_password=DB_PASSWORD_${i}

  echo "CREATE DATABASE ${!db_name} DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;" >> ${OUTPUT_FILE}
  echo "CREATE USER \"${!db_user}\"@\"%\" IDENTIFIED BY \"${!db_password}\";" >> ${OUTPUT_FILE}
  echo "GRANT ALL PRIVILEGES ON ${!db_name}.* TO '${!db_user}'@'%';" >> ${OUTPUT_FILE}
done
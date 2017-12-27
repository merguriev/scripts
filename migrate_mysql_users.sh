#!/bin/bash
user=$1;
password=$2;
host="localhost";
if [ -n "$3" ]
 then host=$3
fi
if [ -z "$1" ] 
 then
 echo "Please use $0 USERNAME PASSWORD DBHOST(default localhost)" 
 exit 0;
fi
mysql -B -N -u$user -p$password -h$host -e "SELECT CONCAT('\'', user,'\'@\'', host, '\'') FROM user WHERE user != 'root' AND user != ''" mysql > mysql_all_users
while read line; do mysql -B -N -u$user -p$password -h$host -e "SHOW GRANTS FOR $line"; done < mysql_all_users > mysql_all_users_sql.sql
sed -i 's/$/;/' mysql_all_users_sql.sql
echo "Created file: mysql_all_users_sql.sql"

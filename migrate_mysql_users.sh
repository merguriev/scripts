#!/bin/bash
user=$1;
password=$2;
if [ -z "$1" ] 
 then
 echo "Please use $0 USERNAME PASSWORD" 
 exit 0;
fi
mysql -B -N -u$user -p -e "SELECT CONCAT('\'', user,'\'@\'', host, '\'') FROM user WHERE user != 'root' AND user != ''" mysql > mysql_all_users
while read line; do mysql -B -N -u$user -p$password -e "SHOW GRANTS FOR $line"; done < mysql_all_users > mysql_all_users_sql.sql
sed -i 's/$/;/' mysql_all_users_sql.sql

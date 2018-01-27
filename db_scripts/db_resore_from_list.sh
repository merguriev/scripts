#!/bin/bash
echo -n "Enter mysql HOSTNAME and press [ENTER]:"
read  host
echo -n "Enter root password for mysql and press [ENTER]:"
read  password
for db in $(cat db_list)
do
 echo "Restore database: $db" 
mysql -uroot -p$password -h$host -e "create database $db;"
mysql -uroot -p$password -h$host $db < "$db.sql"
done


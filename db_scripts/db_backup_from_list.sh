#!/bin/bash
echo "Please enter root password for mysql:"
read password
for db in $(cat db_list)
do
 echo "Backup database: $db" 
mysqldump -uroot -p$password $db > "$db.sql"
done


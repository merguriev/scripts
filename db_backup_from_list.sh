#!/bin/bash
echo "Please enter root password for mysql:"
read password
[ ! -d "db_backup" ] && mkdir db_backup
cd db_backup
for db in $(cat dbs)
do
 echo "Backup database: $db" 
mysqldump -uroot -p$password $db > "$db.sql"
done


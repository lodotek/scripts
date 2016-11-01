#!/bin/bash
###Sample SED script to update my.cnf file###

file="/etc/mysql/my.cnf"
if [ -w "$file" ] #Check if you have write permissions
then
  echo "Setting default collation to UTF-8 in /etc/mysql/my.cnf" 
  sed '/\[mysqld\]/a # set default collation\
collation-server = utf8_unicode_ci\
init-connect='\''SET NAMES utf8'\''\
character-set-server = utf8\' -i "$file"

else
  echo "Can't write to $file. ry running the script with 'sudo'."
fi

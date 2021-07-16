#!/bin/bash

# - - - - - - - - - - - - - - - - - - - version 16july2021 - - -
#
#
# sendEmail - http://caspian.dotconf.net/menu/Software/SendEmail/
#
#
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


backupfolder="/Public/Extensis Portfolio VAULT Backups"

numbertokeep=3

backuplogfilename=VAULT_Backup_Log.txt

emailserver=mail.example.com
 
emailto=example.recipient@example.com
 
emailfrom=ServerName_noreply@example.com
 
emailsubject="Portfolio Notification: VAULT Backup Log"


# - - - - - - - - - - - - - - - - - - - - - - - - -
# - - - - - - - - - - - - - - - - - - - - - - - - -


rm -f "$backupfolder/$backuplogfilename"

foldername=vault_$(date +%Y-%m-%dT%H-%M-%S)

{

mkdir "$backupfolder/$foldername"

"/Applications/Extensis/Portfolio Server/applications/mongodb/bin/mongodump" --port 37017 --out "$backupfolder/$foldername"

cd "$backupfolder"

zip -rv "$backupfolder/$foldername.zip" "$foldername/"*

rm -Rf "$backupfolder/$foldername"

find "$backupfolder" -name '*.zip' -mtime +$numbertokeep -exec rm {} \; 

} 2>&1 | tee "$backupfolder/$backuplogfilename"

emailbody=`cat "$backupfolder/$backuplogfilename"`

./sendEmail -m "$emailbody" -t $emailto -f $emailfrom -u $emailsubject -s $emailserver

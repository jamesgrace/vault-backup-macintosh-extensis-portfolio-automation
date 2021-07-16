# vault-backup-macintosh-extensis-portfolio-automation
Apple Macintosh Bash script that includes logging , retention of a desired number of previous Vault backups , customizable email notifications , as well as the capability for predetermined scheduling ( _via Cron Job_ ).

#### Requirements :
* Extensis Portfolio version 3.6.3 ( _or greater_ ).
* sendEmail - http://caspian.dotconf.net/menu/Software/SendEmail/

## Installation Procedure :

#### 1. PORTFOLIO SERVER VERSION
* Via the Portfolio Administration ( _:8091_ ) Web interface , verify the current version of your Portfolio instance.
  * Although the provided example may work with earlier Portfolio versions , Portfolio version 3.6.3 ( _or greater_ ) is recommended.

#### 2. DATA DRIVE PROVISIONING
* Verify that the target data drive has been provisioned with ample drive space and that the desired sub-folder has been created.

#### 3. BATCH FILE CONFIGURATION
* **`VAULT_backup.sh`**

  * `backupfolder` = `"/Public/Extensis Portfolio VAULT Backups"`
    * Folder location of Vault backups.
  * `numbertokeep` = `3`
    * How many previous Vault backups to retain.
  * `backuplogfilename` = `VAULT_Backup_Log.txt`
    * Filename for the Vault Backup log.
  * `emailserver` = `mail.example.com`
    * Email - Server
  * `emailto` = `example.recipient@example.com`
    * Email - To:
  * `emailfrom` = `ServerName_noreply@example.com`
    * Email - From:
  * `emailsubject` = `"Portfolio Notification: VAULT Backup Log"`
    * Email - Subject:

:warning: The ( _mongodump_ ) command can be run while Portfolio is actively running ( _aka “hot” backups_ ) — but , note that periodic **Portfolio Vault Backups must be timed to occur at the same exact time that scheduled Portfolio environment backups occur**.

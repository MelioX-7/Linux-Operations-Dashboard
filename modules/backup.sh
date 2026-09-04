#!/bin/bash


create_backup() {
    read -p "Enter file/directory to backup: " source

    if [ ! -e "$source" ]; then
        echo "File or directory does not exist."
        return
    fi

    timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    backup_file="backups/backup_${timestamp}.tar.gz"


    if tar -czf "$backup_file" "$source"
    then
	echo "BackUp created successfully : $backup_file"
    else
	echo "Backup Failed"
   fi

}

list_backups() {
    echo "Available Backups:"
    ls -lh backups/*.tar.gz
}



restore_backup() {
    read -p "Enter backup file to restore: " backup_file

    if [ ! -f "$backup_file" ]; then
        echo "Backup file does not exist."
        return
    fi

    echo "Files inside backup:"
    tar -tzf "$backup_file"
    read -p "Enter file to restore: " restore_file


   if ! tar -tzf "$backup_file" | grep -Fxq "$restore_file"
   then
   echo "File does not exist in the backup."
   return

   fi

   if [ -e "$restore_file" ]; then
      read -p "File already exists. Overwrite? (y/n): " confirm

      if [ "$confirm" != "y" ]; then
         echo "Restore cancelled."
         return
      fi
    fi

    if tar -xzf "$backup_file" "$restore_file"
    then
        echo "Backup restored successfully: $restore_file"
    else
        echo "Restore failed."
    fi
}

delete_backup() {
    read -p "Enter backup file to delete: " backup_file

    if [ ! -f "$backup_file" ]; then
        echo "Backup file does not exist."
        return
    fi

    read -p "Are you sure you want to delete this backup? (y/n): " confirm

    if [ "$confirm" != "y" ]; then
        echo "Deletion cancelled."
        return
    fi

    if rm "$backup_file"; then
        echo "Backup deleted successfully."
    else
        echo "Failed to delete backup."
    fi
}


backup_utility() {
    while true
    do

	clear

        echo "===================================="
        echo "          BACKUP UTILITY"
        echo "===================================="
	echo
        echo "1. Create Backup"
        echo "2. List Backups"
        echo "3. Restore Backup"
        echo "4. Delete Backup"
        echo "0. Back"
	echo
        echo "===================================="

        read -p "Enter your choice: " backup_choice

        case $backup_choice in
            1)
                create_backup
                ;;
            2)
                list_backups
                ;;
            3)
                restore_backup
                ;;
            4)
                delete_backup
                ;;
            0)
                break
                ;;
            *)
                echo "Invalid choice."
                ;;
        esac

        echo
	read -p "Press Enter to Continue... "
	clear
    done
}

#!/bin/bash

home=/home/mohammed28

check_file_exist()
{
  file_name="${file_name/#\~/$HOME}"  # Expand tilde first
if [[ -e "$file_name" ]]; then
  return 0
else
  return 1
fi
}

nexist()
{
echo "Not Exist"
}

get_user ()
{
  echo "$USER"
}

get_file_permission()
{
  if [[ check_file_exist ]]; then
  ls -l "$file_name"
else
  nexist
  fi
}

change_file_permission()
{

  if [[ check_file_exist ]]
  then

  echo "Enter the permisson you want to add"
  echo  -e "
000 - No access for anyone \n 
600 - Owner only: read/write \n 
644 - Owner: read/write, Group/Others: read-only \n 
755 - Owner: full, Group/Others: read/execute \n 
777 - Full access for everyone (⚠️ dangerous!) \n 
  "
  read -p "Enter the permission" permisson
  
    case "$permisson" in
      000|600|644|777|755) chmod "$permisson" "$file_name"
        get_file_permission
      ;;
      
    *) echo "This permisson is Wrong" 
      ;;
    esac
    

  else 
    nexist
  fi
}

compress_file()
{

  if [[ check_file_exist ]]
  then
    read -p "Enter the name of Compressed: " name
# Compress directory
        # Get directory and base name
        dir_name=$(dirname "$file_name")
        base_name=$(basename "$file_name")
        # Create archive without absolute paths
        tar -czvf "${name}.tar.gz" -C "$dir_name" "$base_name"
        echo "Compression completed successfully"

  else
    nexist
  fi
}

decompress_file()
{

  if [[ check_file_exist ]]
  then
    read -p "Enter the name of Folder: " name
    #unzip "$file_name" -d "$name"
       mkdir -p "$name"  # Create the target directory
        
        # Decompress .tar.gz file
        tar -xzvf "$file_name" -C "$name"
        echo "Decompression completed successfully"
  else
    nexist
  fi
}

print_message()
{

  echo -e "\n\n========== Linux System Manager ==========
1. Show System Information
2. Check File Permissions
3. Change File Permissions
4. Compress a File/Directory
5. Decompress a File
6. Exit
==========================================

"
}
 
#print_message
#read -rp "Enter your choice: " choice
#echo -e "
 #========== Linux System Manager ==========
#1. Show System Information
#2. Check File Permissions
#3. Change File Permissions
#4. Compress a File/Directory
#5. Decompress a File
#6. Exit
#==========================================
#Enter your choice: "
while true; do
  


print_message
read -rp "Enter your choice: "  choice

case "$choice" in
  1) get_user
    ;;
    
  2)read -p "Enter the file you want to check permissions: " file_name
    file_name="${file_name/#\~/$home}"  # Tilde expansion
    get_file_permission
    read -p "Press [Enter] to continue..."
    ;;
  3)read -p "Enter the file you want to change the permisson: "  file_name
        file_name="${file_name/#\~/$home}"  # Tilde expansion
    change_file_permission
        read -p "Press [Enter] to continue..."
    ;;
  4) read -p "Enter the name of file you want to be: " file_name
        file_name="${file_name/#\~/$home}"  # Tilde expansion
    compress_file
        read -p "Press [Enter] to continue..."
    ;;
    
  5) read -p "Enter the name of file you want to decompress" file_name
        file_name="${file_name/#\~/$home}"  # Tilde expansion
    decompress_file
        read -p "Press [Enter] to continue..."
    ;;
  6) exit 0
    ;;
  *) echo -e "you entered wrong number\n"
esac
done


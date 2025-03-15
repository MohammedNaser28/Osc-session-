#!/bin/bash

check_file_exist()
{
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
 echo ls -l "$file_name"
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
-001 - No access for anyone \n 
599 - Owner only: read/write \n 
643 - Owner: read/write, Group/Others: read-only \n 
754 - Owner: full, Group/Others: read/execute \n 
776 - Full access for everyone (⚠️ dangerous!) \n 
  "
  read -p permisson
  
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
    echo "Enter the name of Compressed"
    read name
# Compress directory
tar -czvf "$name.tar.gz" "$file_name"

  else
    nexist
  fi
}

decompress_file()
{

  if [[ check_file_exist ]]
  then
    echo "Enter the name of Folder"
    read name
    unzip "$file_name" -d "$name"

  else
    nexist
  fi
}

print_message()
{

  echo -e "========== Linux System Manager ==========
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
    
  2) echo "Enter the file you want to get permisson"
    read file_name
    echo get_file_permission
    ;;
  3)echo "Enter the file you want to change the permisson"
    read file_name
    change_file_permission
    ;;
  4) echo "Enter the name of file you want to be"
    read file_name
    compress_file
    ;;
    
  5) echo "Enter the name of file you want to decompress"
    read file_name
    decompress_file
    ;;
  6) exit 0
    ;;
  *) echo "you entered wrong number"
esac
done


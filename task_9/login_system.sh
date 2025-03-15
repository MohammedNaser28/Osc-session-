#!/bin/bash

echo "Please Enter your role"

read role 

case $role in
  Admin) echo "Welcome, Admin! You have full access."
  ;;
  Editor) echo "Welocme, Editor! You can edit content."
  ;;
Viewer) echo "Welocme, Viewer! You can only view content."
  ;;
*) echo "Invalid role. Please enter Admin, Editor, Viewer"
  ;;
esac



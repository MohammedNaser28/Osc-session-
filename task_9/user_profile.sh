#!/bin/bash

echo "Hello, man! I want to ask you some qeustion"
echo "Tell me What's your name?"
read name 
echo "Can you tell me your age ,please"
read age
echo "What's Favorite Programming Language?"
read lang 

echo -e "Thank you, $name! Your profile has been created successfully with the following details:\n  
- Name: $name\n
- Age: $age\n  
- Favorite Programming Language: $lang"

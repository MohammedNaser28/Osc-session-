cut -f1 keys; cut -f2 keys | sort | uniq -d > extracted_keys.txt
grep -o 'https\?://[^[:space:]]\+\|www\.[^[:space:]]\+\.[[:alpha:]]\{2,\}' data.txt
grep -o '\+[0-9]\{7,15\}\|[0-9]\{7,15\}' data.txt 
grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' data.txt


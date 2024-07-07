#!/bin/bash
# get_yaml_files.sh

directory=$1
files=$(find "$directory" -type f -name '*.yaml')
json="{"

for file in $files; do
    filename=$(basename "$file" .yaml)
    json+="\"$filename\":\"$file\","
done

json=${json%,}
json+="}"

echo $json | jq .

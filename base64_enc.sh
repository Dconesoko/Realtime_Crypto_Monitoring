#!/bin/bash

# Read the content of the .env file line by line
cat .env | while IFS= read -r line; do

  # Split the line into key and value parts using '=' as the delimiter
  key=$(echo "$line" | cut -d '=' -f 1)
  value=$(echo "$line" | cut -d '=' -f 2-)

  # Encode the value using base64
  encoded_value=$(echo "$value" | base64)

  # Add the key and encoded value to the secret.yaml file
  echo "  $key: $encoded_value" >> ./k8s/postgres/postgres-secret.yaml

done

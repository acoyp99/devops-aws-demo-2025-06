#!/bin/bash

# Set key name and file name
KEY_NAME=$1
KEY_FILE="${KEY_NAME}.pem"

# Check if key already exists locally
if [ -f "$KEY_FILE" ]; then
    echo "❌ Key file '$KEY_FILE' already exists in this folder."
    exit 1
fi

# Create the key pair and save the private key material
echo "🔐 Creating EC2 key pair: $KEY_NAME"
aws ec2 create-key-pair \
    --key-name "$KEY_NAME" \
    --query 'KeyMaterial' \
    --output text > "$KEY_FILE"

# Secure the key file
chmod 400 "$KEY_FILE"
echo "✅ Key pair created and saved to ./$KEY_FILE"


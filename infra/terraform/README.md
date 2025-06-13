# Infra Provisioning

### 1. associate AWS CREDENTIAL KEYS


### 2. create SSH Key 

- Execute sh file [create_ec2_key.sh](./scripts/create_ec2_key.sh)
```sh
sh scripts/create_ec2_key.sh "chatbot_key_pem"
```


### 3. Validate PEM Key

```sh
aws ec2 describe-key-pairs \
  --query "KeyPairs[*].{KeyName:KeyName,KeyFingerprint:KeyFingerprint}" \
  --output table
```

### 4. Execute terraform Makefile

- Validate 
 
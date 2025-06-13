#!/bin/bash

# Define AWS_ACCOUNT_ID variable as the current AWS account ID
export AWS_ACCOUNT_ID=`aws sts get-caller-identity --query Account --output text`

# Create users and keys
ansible-playbook -i host.yml iam.yml -t iam_user_create,iam_user_key

# Create groups
ansible-playbook -i host.yml iam.yml -t iam_group_create

# Create policies
ansible-playbook -i host.yml iam.yml -t iam_policy_create

# Attach group policies
ansible-playbook -i host.yml iam.yml -t iam_group_attach_policy
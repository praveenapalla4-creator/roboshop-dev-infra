#!/bin/bash

dnf install ansible -y
# ansible-pull -U https://github.com/praveenapalla4-creator/ansible-roboshop-roles-tf.git -e component=$component main.yaml
# git clone ansible-playbook
#cd ansible-playbook
#ansible-playbook -i inventory main.yaml
REPO_URL=https://github.com/praveenapalla4-creator/ansible-roboshop-roles-tf.git
REPO_DIR=/opt/roboshop/ansible
ANSIBLE_DIR=ansible-roboshop-roles-tf
environment=$2
component=$1

mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop/
touch ansible.log


cd $REPO_DIR
#chekc if anisible repo is already closed or not

if [ -d $ANSIBLE_DIR ]; then
  
  cd $ANSIBLE_DIR
  git pull
else 
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi

ansible-playbook -e component=$component   main.yaml
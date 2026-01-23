#!/bin/bash

dnf install ansible -y
ansible-pull -U https://github.com/praveenapalla4-creator/ansible-roboshop-roles-tf.git -e component=mongodb main.yaml
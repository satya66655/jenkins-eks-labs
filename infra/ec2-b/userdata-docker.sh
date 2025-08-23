#!/bin/bash
# Cloud-init script for Amazon Linux 2023
dnf update -y
dnf install -y docker git
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user


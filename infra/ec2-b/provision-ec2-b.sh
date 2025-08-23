#!/bin/bash
# Provision EC2 Instance B with Amazon Linux 2023 + Docker

set -e

AMI_ID="ami-00ca32bbc84273381"   # Amazon Linux 2023 (update for us-east-1 if different)
INSTANCE_TYPE="t3.micro"
KEY_NAME="886436941748_NV-Mar-25"                # Replace with your key pair name
SECURITY_GROUP="sg-0c20946163121270b"     # Replace with SG allowing 22, 80, etc.
SUBNET_ID="subnet-06bac8cc234bc3fd4"      # Replace with a valid subnet ID

echo "Launching EC2 Instance B..."
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id $AMI_ID \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP \
  --subnet-id $SUBNET_ID \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Instance-B}]' \
  --user-data file://infra/ec2-b/userdata-docker.sh \
  --query 'Instances[0].InstanceId' \
  --output text)

echo "Waiting for instance to be running..."
aws ec2 wait instance-running --instance-ids $INSTANCE_ID

PUBLIC_IP=$(aws ec2 describe-instances \
  --instance-ids $INSTANCE_ID \
  --query 'Reservations[0].Instances[0].PublicIpAddress' \
  --output text)

echo "Instance B ready:"
echo "Instance ID: $INSTANCE_ID"
echo "Public IP:   $PUBLIC_IP"


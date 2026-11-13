#!/bin/bash

SG_ID="sg-01fbe57adf7146345"
AMI_ID="ami-0055977a6e828a4f4"

for instance in $@

do 

aws ec2 run-instances --image-id $AMI_ID  --security-group-id $SG_ID--instance-type=t3.micro --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=$instance}]' --query 'Reservations[0].Instances[0].PrivateIpAddress ' --output text


done


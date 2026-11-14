#!/bin/bash

SG_ID="sg-01fbe57adf7146345"
AMI_ID="ami-0055977a6e828a4f4"

for instance in "$@"
do

    echo "Creating $instance instance..."

    INSTANCE_ID=$(aws ec2 run-instances \
        --image-id "$AMI_ID" \
        --security-group-ids "$SG_ID" \
        --instance-type t3.micro \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" \
        --query 'Instances[0].InstanceId' \
        --output text)

    if [ -z "$INSTANCE_ID" ] || [ "$INSTANCE_ID" = "None" ]; then
        echo "ERROR: Instance creation failed for $instance"
        continue
    fi

    echo "Instance ID: $INSTANCE_ID"

    # Wait until instance is running
    aws ec2 wait instance-running \
        --instance-ids "$INSTANCE_ID"

    if [ "$instance" = "frontend" ]; then

        IP=$(aws ec2 describe-instances \
            --instance-ids "$INSTANCE_ID" \
            --query 'Reservations[0].Instances[0].PublicIpAddress' \
            --output text)

    else

        IP=$(aws ec2 describe-instances \
            --instance-ids "$INSTANCE_ID" \
            --query 'Reservations[0].Instances[0].PrivateIpAddress' \
            --output text)

    fi

    echo "$instance IP Address: $IP"

done
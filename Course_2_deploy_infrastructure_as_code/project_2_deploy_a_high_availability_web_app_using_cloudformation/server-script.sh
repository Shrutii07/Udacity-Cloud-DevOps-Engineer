#!/bin/bash

STACK_NAME="website-server"
ACTION=$1

case $ACTION in

  create)
    aws cloudformation create-stack \
    --stack-name $STACK_NAME \
    --template-body file://udagram.yml \
    --parameters file://udagram-parameters.json \
    --capabilities "CAPABILITY_NAMED_IAM"  \
    --region=us-east-1
    ;;

  update)
    aws cloudformation update-stack \
    --stack-name $STACK_NAME \
    --template-body file://udagram.yml \
    --parameters file://udagram-parameters.json \
    --capabilities "CAPABILITY_NAMED_IAM"  \
    --region=us-east-1
    ;;

  delete)
    aws cloudformation delete-stack \
    --stack-name $STACK_NAME
    ;;

  *)
    echo -n "unknown argument, expecting (create | update | delete)"
    ;;
esac
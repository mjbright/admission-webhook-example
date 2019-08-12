#!/bin/bash

DEPLOY=deploy/admission-webhook-example-deployment

#while true;do clear; kubectl logs -f $DEPLOY ; sleep 1; done
while true; do
    clear;
    echo "---- kubectl logs -f $DEPLOY"
    kubectl logs -f $DEPLOY;
    sleep 1;
done



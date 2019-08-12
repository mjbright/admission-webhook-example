#!/bin/bash

echo; echo "---- Deleting ValidatingWebhookConfiguration/validation-webhook-example-cfg ..."
kubectl delete ValidatingWebhookConfiguration/validation-webhook-example-cfg

echo; echo "---- Deleting service/admission-webhook-example-svc ..."
kubectl delete service/admission-webhook-example-svc

echo; echo "---- Deleting deploy/admission-webhook-example-deployment ..."
kubectl delete deploy/admission-webhook-example-deployment

echo; echo "---- Deleting deploy/sleep ..."
kubectl delete -f deployment/sleep.yaml


echo; echo "---- Showing any remaining objects ..."


kubectl get deploy,pods,rs,svc,ValidatingWebhookConfiguration,MutatingWebhookConfiguration | grep -E "webhook|sleep"


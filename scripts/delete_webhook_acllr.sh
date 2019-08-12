#!/bin/bash

echo; echo "---- Deleting ValidatingWebhookConfiguration/validation-webhook-example-cfg ..."
kubectl delete ValidatingWebhookConfiguration/validation-webhook-example-cfg

echo; echo "---- Deleting service/admission-webhook-example-svc ..."
kubectl delete service/admission-webhook-example-svc

echo; echo "---- Deleting deploy/admission-webhook-example-deployment ..."
kubectl delete deploy/admission-webhook-example-deployment





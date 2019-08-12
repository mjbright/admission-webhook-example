#!/bin/bash

NS=default
EXAMPLE="admission-webhook-example"

echo; echo "---- Deploying patched validatingwebhook deployment && service:"
kubectl create -f deployment/deployment.yaml
kubectl create -f deployment/service.yaml

#kubectl get all | grep -i admission
kubectl get deploy,pods,rs,svc,ValidatingWebhookConfiguration,MutatingWebhookConfiguration | grep -E "webhook|sleep"


echo; echo "---- Creating patched validatingwebhook config:"
cat deployment/validatingwebhook.yaml | deployment/webhook-patch-ca-bundle.sh > deployment/validatingwebhook-patched.yaml

echo; echo "---- Showing diff of patched validatingwebhook config:"
diff deployment/validatingwebhook.yaml deployment/validatingwebhook-patched.yaml
#more deployment/validatingwebhook-patched.yaml

echo; echo "---- Setting label on namespace <$NS> to enable <$EXAMPLE>"

kubectl label namespace $NS $EXAMPLE=enabled --overwrite
#kubectl get namespace $NS -o yaml | grep -E "name:|admission-webhook"
kubectl get namespace $NS --show-labels

echo; echo "---- Creating validating webhook object"
kubectl create -f deployment/validatingwebhook-patched.yaml

kubectl get deploy,pods,rs,svc,ValidatingWebhookConfiguration,MutatingWebhookConfiguration | grep -E "webhook|sleep"


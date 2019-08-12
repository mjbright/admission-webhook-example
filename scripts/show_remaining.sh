#!/bin/bash

#while kubectl get pods | grep "[A-z]" ; do sleep 1; done

while kubectl get deploy,pods,rs,svc,ValidatingWebhookConfiguration,MutatingWebhookConfiguration | grep -E "webhook|sleep"; do
    sleep 1
    echo "----"
done

kubectl get deploy,pods,rs,svc,ValidatingWebhookConfiguration,MutatingWebhookConfiguration | grep -E "webhook|sleep"
exit 0

#### ---------------------------------------------------------------------

while true; do
    kubectl get deploy,pods,rs,svc,ValidatingWebhookConfiguration,MutatingWebhookConfiguration | grep -E "webhook|sleep"
    sleep 1
    echo "----"
done


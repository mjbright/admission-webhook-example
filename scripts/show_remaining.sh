


while true; do
    kubectl get deploy,pods,rs,svc,ValidatingWebhookConfiguration,MutatingWebhookConfiguration | grep -E "webhook|sleep"
    sleep 1
    echo "----"
done


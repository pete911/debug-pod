# debug-pod

kubernetes debug pod

 - copy/download [debug-pod.yaml](debug-pod.yaml) file
 - start pod `kubectl create -n <namespace> -f debug-pod.yaml`
 - exect inside `kubectl exec -it -n <namespace> debug-pod -- /bin/sh`

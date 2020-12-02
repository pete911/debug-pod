[![Build Status](https://travis-ci.com/pete911/debug-pod.svg?branch=master)](https://travis-ci.com/pete911/debug-pod)

# debug-pod

[debug pod](https://hub.docker.com/r/pete911/debug-pod) conatainer image with the following packages installed:

 - [certinfo](https://github.com/pete911/certinfo)
 - curl
 - bind-tools
 - openssl
 - netcat-openbsd
 - iputils
 - telnet

## run

 - default namespace, latest image - `kubectl run debug --image=pete911/debug-pod --rm -it --restart=Never -- sh`
 - specify namespace and image - `kubectl run debug -n <namespace> --image=pete911/debug-pod:<version> --rm -it --restart=Never -- sh`

If you need to target specific node, access node file system, you can create pod manifest and apply it, e.g. create `debug-pod.yaml` file:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: debug-pod
spec:
  containers:
    - image: pete911/debug-pod:latest
      name: debug-pod
      command:
        - sleep
        - "3600"
      volumeMounts:
        - name: host
          mountPath: /host
  volumes:
    - name: host
      hostPath:
        path: /
        type: Directory
```
and then run `kubectl apply -f debug-pod.yaml`

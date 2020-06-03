# debug-pod

alpine container with installed packages:

```
curl
bind-tools
openssl
netcat-openbsd
```

## run

 - default namespace, latest image - `kubectl run debug --image=pete911/debug-pod --rm -it --restart=Never -- sh`
 - specify namespace and image - `kubectl run debug -n <namespace> --image=pete911/debug-pod:<version> --rm -it --restart=Never -- sh`

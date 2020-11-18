[![Build Status](https://travis-ci.com/pete911/debug-pod.svg?branch=master)](https://travis-ci.com/pete911/debug-pod)

# debug-pod

[debug pod](https://hub.docker.com/r/pete911/debug-pod) conatainer image with the following packages installed:

 - [certinfo](https://github.com/pete911/certinfo)
 - curl
 - bind-tools
 - openssl
 - netcat-openbsd
 - iputils

## run

 - default namespace, latest image - `kubectl run debug --image=pete911/debug-pod --rm -it --restart=Never -- sh`
 - specify namespace and image - `kubectl run debug -n <namespace> --image=pete911/debug-pod:<version> --rm -it --restart=Never -- sh`

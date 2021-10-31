#!/bin/bash
sudo -i -u vagrant bash << EOF
export NODE_PORT=$(kubectl get services/app-one -o go-template='{{(index .spec.ports 0).targetPort}}')
export NODE_PORT=$(kubectl get services/app-two -o go-template='{{(index .spec.ports 0).targetPort}}')
export NODE_PORT=$(kubectl get services/app-three -o go-template='{{(index .spec.ports 0).targetPort}}')

EOF

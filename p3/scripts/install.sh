export K3D_FIX_DNS=1
k3d cluster create mycluster
kubectl create ns argocd
kubectl create ns dev
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

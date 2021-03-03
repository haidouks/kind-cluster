set -ex
echo "Creating cluster"
kind create cluster --config=./config/kind.yaml --name test
echo "Installing ingress"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml
echo "Installing cert manager"
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.0.2/cert-manager.yaml
echo "Installing certs"
kubectl apply --validate=true -f ./certs/cert-issuer.yaml

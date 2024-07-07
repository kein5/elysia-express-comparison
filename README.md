# elysia.js vs. express.js performance comparison

## how to setup

1. run devcontainer

   build and run the devcontainer by using any of the tools below.

   - github codespaces
   - local devcontainer command (installed by npm or as such)

   assuming the following steps to be run in the devcontainer built in this step.

2. create minikube cluster

   ```bash
   minikube start \
      --driver=docker \
      --nodes=1 \
      --memory='2g' \
      --cpus=2 \
      --kubernetes-version=v1.29.2 \
      --apiserver-port=8443 \
      --addons=[default-storageclass,storage-provisioner,ingress,dashboard,metrics-server]
   ```

3. run terraform command

   ```bash
   cd terraform && terraform init && terraform apply -auto-approve
   ```

4. expose ingress port

   ```bash
   kubectl port-forward --pod-running-timeout=24h -n ingress-nginx service/ingress-nginx-controller :80 &
   ```

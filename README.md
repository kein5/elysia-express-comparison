# elysia.js vs. express.js performance comparison

## how to setup

1. run devcontainer

   build and run the devcontainer by using any of the tools below.

   - github codespaces
   - local devcontainer command (installed by npm or as such)

   assuming the following steps to be run in the devcontainer built in this step.

2. git setting

   set the workspace as a safe directory.

   ```
   git config --global --add safe.directory /workspaces/elysia-express-comparison
   ```

3. create minikube cluster

   ```bash
   minikube start \
      --driver=docker \
      --nodes=1 \
      --memory='4g' \
      --cpus=2 \
      --kubernetes-version=v1.30.3 \
      --apiserver-port=8443
   ```

4. run terraform command

   ```bash
   cd terraform && terraform init && terraform apply -auto-approve
   ```

5. expose ingress port

   ```bash
   kubectl port-forward --namespace ingress-nginx svc/ingress-nginx-controller :80 &
   ```

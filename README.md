# elysia.js vs. express.js performance comparison

## how to setup

1. run the devcontainer

   build and run the devcontainer by using any of the tools below.

   - github codespaces
   - local devcontainer command (installed by npm or as such)

   assuming the following steps to be run in the devcontainer built in this step.

2. run terraform command

   ```
   cd terraform && terraform init && terraform apply -auto-approve
   ```

3. expose the ingress port

   ```
   kubectl port-forward --pod-running-timeout=24h -n ingress-nginx service/ingress-nginx-controller :80 &
   ```

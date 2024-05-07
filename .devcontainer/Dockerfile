FROM mcr.microsoft.com/devcontainers/base:bookworm

# define versions **CHANGE THESE TO THE VERSIONS YOU WANT**
# note: TERRAFORM_VERSION must NOT have a 'v' prefix
ENV KUBERNETES_VERSION=v1.29.2
ENV TERRAFORM_VERSION=1.8.2
ENV TERRAGRUNT_VERSION=v0.58.3
ENV KIND_VERSION=v0.22.0

# install docker
RUN apt update
RUN apt install -y \
    docker.io \
    unzip

# install kubectl
RUN curl -fsSLo /usr/local/bin/kubectl https://dl.k8s.io/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl

# install terraform
WORKDIR /tmp
RUN curl -fsSLO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && chmod +x terraform \
    && mv terraform /usr/local/bin/terraform \
    && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# install terragrunt
WORKDIR /tmp
RUN curl -fsSLo /usr/local/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 \
    && chmod +x /usr/local/bin/terragrunt

# install kind
RUN curl -fsSLo /usr/local/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/${KIND_VERSION}/kind-linux-amd64 \
    && chmod +x /usr/local/bin/kind

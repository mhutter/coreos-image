FROM quay.io/fedora/fedora-coreos:stable

# TODO: Configure Zincati

# Install tailscale & container-selinux
COPY ./files/rancher-k3s-common.repo /etc/yum.repos.d/rancher-k3s-common.repo
RUN curl -L https://pkgs.tailscale.com/stable/fedora/tailscale.repo -o  /etc/yum.repos.d/tailscale.repo && \
    rpm-ostree install container-selinux k3s-selinux tailscale && \
    systemctl enable tailscaled && \
    ostree container commit

# Install K3s
COPY --chmod=0600 ./files/k3s-config.yaml /etc/rancher/k3s/config.yaml
COPY --chmod=0600 ./files/k3s.service /etc/systemd/system/k3s.service
ENV INSTALL_K3S_VERSION="v1.31.2+k3s1"
RUN curl -L "https://github.com/k3s-io/k3s/releases/download/${INSTALL_K3S_VERSION}/k3s" -o /usr/bin/k3s && \
    chmod +x /usr/bin/k3s && \
    ostree container commit

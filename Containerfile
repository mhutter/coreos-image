FROM quay.io/fedora/fedora-coreos:stable
RUN cd /etc/yum.repos.d/ && curl -LO https://pkgs.tailscale.com/stable/fedora/tailscale.repo && \
    rpm-ostree install tailscale && \
    systemctl enable tailscaled && \
    ostree container commit

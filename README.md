# CoreOS ostree native container

See https://coreos.github.io/rpm-ostree/container/

## Installing

```sh
apt-get update
apt-get install -y podman
update-alternatives --set iptables /usr/sbin/iptables-legacy

podman run --privileged --rm -v /dev:/dev -v /run/udev:/run/udev -v .:/data -w /data quay.io/coreos/coreos-installer:release install /dev/sda -i config.ign
```

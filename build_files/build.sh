#!/bin/bash

set -ouex pipefail

### Install packages

# Clash verge rev
wget -O /tmp/clash.rpm https://github.com/clash-verge-rev/clash-verge-rev/releases/download/v2.4.2/Clash.Verge-2.4.2-1.x86_64.rpm && dnf5 install -y /tmp/clash.rpm

# Nix
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# systemctl enable podman.socket

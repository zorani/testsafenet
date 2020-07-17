#!/usr/bin/env bash

wget -qO- https://safe-api.s3.amazonaws.com/install.sh | bash
source .bashrc
safe update
safe auth install
safe auth update
safe vault install
safe vault update
safe networks add shared-section https://safe-vault-config.s3.eu-west-2.amazonaws.com/shared-section/vault_connection_info.config
safe networks switch shared-section
safe networks check
export RUST_LOG=safe=trace
safe vault join

#!/bin/bash
DFXVM_INIT_YES=true sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"
source "$HOME/.local/share/dfx/env"

echo "$FUEL_DAO_APP_ADMIN_AND_PROPOSAL_SUBMITTER_PRIVATE_KEY" > ~/identity.pem
dfx identity import fuel_dao_app_admin ~/identity.pem --storage-mode plaintext
rm ~/identity.pem

echo "$FUEL_DAO_SNS_CONTROLLER_ADMIN_PRIVATE_KEY" > ~/identity.pem
dfx identity import fuel_dao_sns ~/identity.pem --storage-mode plaintext
rm ~/identity.pem
dfx identity use fuel_dao_sns

export DFX_WARNING=-mainnet_plaintext_identity
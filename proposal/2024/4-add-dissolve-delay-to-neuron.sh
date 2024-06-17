export IDENTITY_NAME="fuel_dao_sns"
export PEM_FILE="$(readlink -f ~/.config/dfx/identity/${IDENTITY_NAME}/identity.pem)"
# export CANISTER_IDS_FILE="./sns_canister_ids.json"
# export NEURON_ID="54f9ba2b0e81a17f5261b277abd91816e041c5ca749ba88b3dbe05f66bb6124d"

dfx identity use "${IDENTITY_NAME}"

# NNS Neuron
# 14_199_361_421_955_379_993

./quill \
  neuron-manage \
  --pem-file "${PEM_FILE}" \
  --additional-dissolve-delay-seconds 16000000 \
  14199361421955379993 > ./proposal/2024/3-stake-icp-for-proposal.json

./quill send --yes ./proposal/2024/3-stake-icp-for-proposal.json
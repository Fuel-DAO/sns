export IDENTITY_NAME="fuel_dao_sns"
export PEM_FILE="$(readlink -f ~/.config/dfx/identity/${IDENTITY_NAME}/identity.pem)"

dfx identity use "${IDENTITY_NAME}"

# NNS Neuron
# 14199361421955379993

./quill \
  neuron-manage \
  --pem-file "${PEM_FILE}" \
  --additional-dissolve-delay-seconds 16000000 \
  14199361421955379993 > ./proposal/2025/3-stake-icp-for-proposal.json

./quill send --yes ./proposal/2025/3-stake-icp-for-proposal.json
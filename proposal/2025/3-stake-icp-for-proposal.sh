export IDENTITY_NAME="fuel_dao_sns"
export PEM_FILE="$(readlink -f ~/.config/dfx/identity/${IDENTITY_NAME}/identity.pem)"

dfx identity use "${IDENTITY_NAME}"

./quill \
  neuron-stake \
  --pem-file "${PEM_FILE}" \
  --amount 10 \
  --name primary > ./proposal/2024/3-stake-icp-for-proposal.json

./quill send --yes ./proposal/2024/3-stake-icp-for-proposal.json

# 14199361421955379993

# ./quill \
#   neuron-manage \
#   --pem-file "${PEM_FILE}" \
#   --disburse \
#   14199361421955379993 > ./proposal/2024/3-stake-icp-for-proposal.json

# ./quill send --yes ./proposal/2024/3-stake-icp-for-proposal.json
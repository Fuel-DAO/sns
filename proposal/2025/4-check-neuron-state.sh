export IDENTITY_NAME="fuel_dao_sns"
export PEM_FILE="$(readlink -f ~/.config/dfx/identity/${IDENTITY_NAME}/identity.pem)"

dfx identity use "${IDENTITY_NAME}"

# 14199361421955379993

# ./quill \
#   list-neurons \
#   --pem-file "${PEM_FILE}" > ./proposal/2025/4-check-neuron-state.json

# ./quill send --yes ./proposal/2025/4-check-neuron-state.json

./quill \
  get-neuron-info \
  --pem-file "${PEM_FILE}" \
  14199361421955379993 --yes
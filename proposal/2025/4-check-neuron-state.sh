export IDENTITY_NAME="fuel_dao_sns"
export PEM_FILE="$(readlink -f ~/.config/dfx/identity/${IDENTITY_NAME}/identity.pem)"

dfx identity use "${IDENTITY_NAME}"

# 14199361421955379993

./quill \
  get-neuron-info \
  --pem-file "${PEM_FILE}" \
  14199361421955379993 --yes
  
#   > ./proposal/2024/4-check-neuron-state.json

# ./quill send --yes ./proposal/2024/4-check-neuron-state.json
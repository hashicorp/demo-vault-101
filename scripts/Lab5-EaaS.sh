echo "Enable 'transit' secrets engine"
vault secrets enable transit

echo ""
echo "Create a new key named 'cards'"
vault write -f transit/keys/cards

echo ""
echo "Encrypt data: vault write transit/encrypt/cards"
vault write -format=json transit/encrypt/cards plaintext=$(base64 <<< "credit-card-number") | jq -r ".data.ciphertext" > cipher.txt

echo ""
echo "Decode data: vault write transit/decrypt/cards"
vault write -format=json transit/decrypt/cards ciphertext=$(cat cipher.txt) | jq -r ".data.plaintext" > plain.txt

base64 --decode <<< $(cat plain.txt)

echo ""
echo "Rotate the cards key"
vault write -f transit/keys/cards/rotate

echo ""
echo "Encrypt another data to examine the output"
vault write -format=json transit/encrypt/cards plaintext=$(base64 <<< "visa-card-number") | jq -r ".data.ciphertext"

echo ""
echo "Rotate the cards key a few times"
vault write -f transit/keys/cards/rotate
vault write -f transit/keys/cards/rotate
vault write -f transit/keys/cards/rotate
vault write -f transit/keys/cards/rotate

echo ""
echo "View the key info"
vault read transit/keys/cards

echo ""
echo "Set the minimum required decryption key to version 5"
vault write transit/keys/cards/config min_decryption_version=5

echo ""
echo "View the key info"
vault read transit/keys/cards

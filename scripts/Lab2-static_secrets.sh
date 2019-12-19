echo "vault login root"
vault login root

echo ""
echo "vault secrets list -detailed"
vault secrets list -detailed

echo ""
echo "vault kv put secret/training username="student01" password='pAssw0rd'"
vault kv put secret/training username="student01" password="pAssw0rd"

echo ""
echo "vault kv get secret/training"
vault kv get secret/training

echo ""
echo "vault kv get -field=username secret/training"
vault kv get -field=username secret/training

echo ""
echo "vault kv put secret/training password='another-password' "
vault kv put secret/training password="another-password"

echo ""
echo "vault kv get secret/training"
vault kv get secret/training

echo ""
echo "vault kv patch secret/training course='Vault 101' "
vault kv patch secret/training course="Vault 101"

echo ""
echo "vault kv get secret/training"
vault kv get secret/training

echo ""
echo "vault kv put secret/company @/workstation/vault101/data.json"
vault kv put secret/company @/workstation/vault101/data.json

echo ""
echo "vault kv get secret/company"
vault kv get secret/company

echo ""
echo "vault kv list secret"
vault kv list secret

echo ""
echo "vault kv delete secret/company"
vault kv delete secret/company

echo ""
echo "curl --header "X-Vault-Token: root" --request POST --data '{"data": {"apikey": "my-api-key"} }' $VAULT_ADDR/v1/secret/data/apikey/google | jq"
curl --header "X-Vault-Token: root" --request POST --data '{"data": {"apikey": "my-api-key"} }' $VAULT_ADDR/v1/secret/data/apikey/google | jq

echo ""
echo "curl --header "X-Vault-Token: root" $VAULT_ADDR/v1/secret/data/apikey/google | jq"
curl --header "X-Vault-Token: root" $VAULT_ADDR/v1/secret/data/apikey/google | jq

echo ""
echo "curl -X DELETE -H "X-Vault-Token: $(vault print token)" http://127.0.0.1:8200/v1/secret/data/apikey/google"
curl -X DELETE -H "X-Vault-Token: $(vault print token)" $VAULT_ADDR/v1/secret/data/apikey/google

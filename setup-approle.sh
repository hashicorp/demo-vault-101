vault login root

# Create db_readonly policy
vault policy write db_readonly - <<POL
path "database/creds/readonly" {
  capabilities = [ "read" ]
}

path "/sys/leases/renew" {
  capabilities = [ "update" ]
}

path "auth/token/create" {
  capabilities = ["update"]
}
POL

# Setup approle
vault auth enable approle
vault write auth/approle/role/apps policies="db_readonly"
echo $(vault read -format=json auth/approle/role/apps/role-id | jq  -r '.data.role_id') > roleID
echo $(vault write -f -format=json auth/approle/role/apps/secret-id | jq -r '.data.secret_id') > secretID

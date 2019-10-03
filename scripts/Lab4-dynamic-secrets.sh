echo "vault secrets enable database"
vault secrets enable database

echo ""
echo "vault write database/config/postgresql plugin_name=postgresql-database-plugin allowed_roles=readonly connection_url=postgresql://postgres@localhost/myapp"
vault write database/config/postgresql plugin_name=postgresql-database-plugin allowed_roles=readonly connection_url=postgresql://postgres@localhost/myapp

echo ""
echo "vault write database/roles/readonly db_name=postgresql creation_statements=@readonly.sql default_ttl=1h max_ttl=24h"
vault write database/roles/readonly db_name=postgresql creation_statements=@/workstation/vault101/readonly.sql default_ttl=1h max_ttl=24h

echo ""
echo "vault read database/creds/readonly"
vault read database/creds/readonly

echo ""
echo "Revoke a lease with lease_id: " $(cat lease.txt)
echo "vault leaes revoke " $(cat lease.txt)
vault read -format=json database/creds/readonly | jq -r ".lease_id" > lease.txt
vault lease revoke $(cat lease.txt)

echo ""
echo "Revoke all leases: vault lease revoke -prefix database/creds/readonly"
vault lease revoke -prefix database/creds/readonly

echo "Run the setup script"
./workstation/vault101/setup-approle.sh

echo ""
echo "Start the Vault Agent"
vault agent -config=/workstation/vault101/agent-config.hcl -log-level=debug

#!/usr/bin/env bash

cat <<EOT
My connection info is:

  username: "$${DATABASE_CREDS_READONLY_USERNAME}"
  password: "$${DATABASE_CREDS_READONLY_PASSWORD}"
  database: "my-app"
EOT
EOF
sudo chmod +x /workstation/vault101/app.sh

sudo tee /workstation/vault101/data.json > /dev/null <<"EOF"
{
  "organization": "hashicorp",
  "region": "US-West",
  "zip_code": "94105"
}

#!/usr/bin/env bash
# Copyright IBM Corp. 2019, 2026


cat <<EOT
My connection info is:

  username: "${DATABASE_CREDS_READONLY_USERNAME}"
  password: "${DATABASE_CREDS_READONLY_PASSWORD}"
  database: "my-app"
EOT

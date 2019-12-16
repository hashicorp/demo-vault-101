#!/usr/bin/env bash

cat <<EOT
My connection info is:

  username: "${DATABASE_CREDS_READONLY_USERNAME}"
  password: "${DATABASE_CREDS_READONLY_PASSWORD}"
  database: "my-app"
EOT

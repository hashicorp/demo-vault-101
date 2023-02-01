#!/usr/bin/env bash
# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


cat <<EOT
My connection info is:

  username: "${DATABASE_CREDS_READONLY_USERNAME}"
  password: "${DATABASE_CREDS_READONLY_PASSWORD}"
  database: "my-app"
EOT

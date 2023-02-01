# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

vault login root

cd /workstation/vault101

# Enable audit log
vault audit enable file file_path=/workstation/vault101/audit.log

# Enable another audit log with raw data
vault audit enable -path=file-raw file file_path=/workstation/vault101/audit-raw.log log_raw=true

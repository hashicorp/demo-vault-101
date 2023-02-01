# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

echo "vault token create -policy=default"
vault token create -policy=default -format=json | jq -r ".auth.client_token" > token.txt

echo ""
echo "vault login " $(cat token.txt)
vault login $(cat token.txt)

echo ""
echo "vault write cubbyhole/private mobile='123-456-7890' "
vault write cubbyhole/private mobile="123-456-7890"

echo ""
echo "vault read cubbyhole/private"
vault read cubbyhole/private

echo ""
echo "Log back in as root"
echo "vault login root"
vault login root

echo ""
echo "vault read cubbyhole/private"
vault read cubbyhole/private

echo ""
echo "vault kv get -wrap-ttl=360 -format=json secret/training"
vault kv get -wrap-ttl=360 -format=json secret/training | jq -r ".wrap_info.token" > wrapping-token.txt

echo ""
echo "vault login " $(cat token.txt)
vault login $(cat token.txt)

echo ""
echo "vault unwrap <WRAPPING_TOKEN>"
vault unwrap $(cat wrapping-token.txt)

echo ""
echo "vault login root"
vault login root

echo ""
echo "Working with Username & Password auth method"
echo "vault auth list"
vault auth list

echo ""
echo "vault auth enable userpass"
vault auth enable userpass

echo ""
echo "vault write auth/userpass/users/student01 password=training policies=default"
vault write auth/userpass/users/student01 password="training" policies="default"
echo ""
echo "vault login -method=userpass username=student01 password=training"
vault login -method=userpass username=student01 password=training

echo ""
echo "vault login root"
vault login root

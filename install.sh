echo "Updating apt repositories ..."
sudo apt update
echo "Installing Ansible ..."
# We might switch to the pip version if this one is too old
sudo apt install -y ansible

echo "Creating desktop icon ..."
# tbd
echo "Installation complete. To continue the configuration, click the new desktop icon. "

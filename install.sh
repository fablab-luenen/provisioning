#!/usr/bin/env sh

### Install Ansible

echo "Updating apt repositories ..."
sudo apt update
echo "Installing Ansible ..."
# We might switch to the pip version if this one is too old
sudo apt install -y python3-pip git
sudo pip3 install ansible
echo "Ansible installed: "
ansible --version
#echo "Installing Ansible community modules"
#ansible-galaxy collection install community.general

### Install playbook

cd /root
sudo git clone https://github.com/fablab-luenen/provisioning/
cd provisioning
sudo git switch lab-pc
sudo chown -R $USER .

### Add desktop icon
launcher=$HOME/Schreibtisch/pull.desktop
echo "[Desktop Entry]
Type=Application
Version=1.0

Name=Update configuration
Name[de]=Konfiguration aktualisieren
Icon=reload

Exec=/root/provisioning/pull.sh
Path=/root/provisioning

Terminal=true" > $launcher
chmod +x $launcher

# Add to autostart
cp $launcher $HOME/.config/autostart

### Run playbook

sudo ansible-playbook lab-pc.yaml

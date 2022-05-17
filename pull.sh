#!/usr/bin/env bash

if read -r -s -n 1 -t 3 -p "Pulling most recent Ansible config (press any key within 3 seconds to abort):" key
then
    echo "Alright. "; exit
fi

# I am aware of ansible-pull. It lacks the flexibility of allowing the editing of files without committing them - and this is pretty much all it does: 
git pull
sudo ansible-playbook lab-pc.yaml

read -n 1 -s -r -p "Done! Press any key to continue" && echo

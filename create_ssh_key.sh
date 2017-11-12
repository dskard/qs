#! /bin/sh

# generate ssh keys
ssh-keygen -t rsa -b 4096 -C "${USER}@`hostname`" -f ~/.ssh/id_rsa
ssh-keygen -t rsa -b 4096 -C "${USER}@`hostname`" -f ~/.ssh/codedsk_github_id

# add the key to the ssh-agent
ssh-add ~/.ssh/id_rsa

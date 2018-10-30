#!/bin/bash
# Generate new ssh2 host keys
# Useful for downloaded or shared vm images.
tar cvf /etc/ssh.tar /etc/ssh
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa -b 521
ls -ltr /etc/ssh/ssh_host*

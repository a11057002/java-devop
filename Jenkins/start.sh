#!/bin/bash
ssh-keyscan 172.28.0.2 >> ~/.ssh/known_hosts
sshpass -p docker ssh-copy-id root@172.28.0.2
ssh-keyscan 172.28.0.5 >> ~/.ssh/known_hosts
sshpass -p docker ssh-copy-id root@172.28.0.5
exec "$@"
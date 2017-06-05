sed -i.bak '/gswansb/d' ~/.ssh/known_hosts
ansible-playbook -i ./hosts test.yml || tee deploy.out

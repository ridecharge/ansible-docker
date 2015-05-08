# ansible-docker
Base container for docker containers that rely on ansible provisioning

This container provides a base for other containers that need to run ansible to provision.

It has the following onbuild commands
```
ONBUILD COPY playbook.yml /tmp/playbook.yml
ONBUILD COPY roles /etc/ansible/roles/
ONBUILD RUN ansible-playbook --connection=local /tmp/playbook.yml
```

which will copy over the playbook.yml and roles and run them in local mode against the docker image being build.
A typical pattern is to checkout the role in the docker root and build time which are referenced by the `playbook.yml` file which is run.

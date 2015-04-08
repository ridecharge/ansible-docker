# Latest Ubuntu LTS
FROM ubuntu:14.04

# Install Ansible
RUN apt-get update && \
	apt-get -y upgrade && \
    apt-get install --no-install-recommends -y \
    software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible

# Make sure only ansible host is localhost
RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts

# Copy our ansible files
ONBUILD COPY playbook.yml /tmp/playbook.yml
ONBUILD COPY roles /etc/ansible/roles/

# Provision the image
ONBUILD RUN ansible-playbook --connection=local /tmp/playbook.yml

# Cleanup
ONBUILD RUN apt-get purge -y --auto-remove \
	ansible \
	software-properties-common

ONBUILD RUN rm /tmp/playbook.yml
ONBUILD RUN rm -r /etc/ansible/roles

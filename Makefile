DOCKER_REPO?=registry.gocurb.internal:80/ansible
CONTAINER=$(DOCKER_REPO)/ansible

all: build push

build:
	sudo docker build -t $(CONTAINER):latest . 

push:
	sudo docker push $(CONTAINER)


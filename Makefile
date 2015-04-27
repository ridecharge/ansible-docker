DOCKER_REPO?=registry.gocurb.internal:80/ansible
CONTAINER=$(DOCKER_REPO)/ansible

all: build push clean

build:
	docker build --no-cache -t $(CONTAINER):latest . 

push:
	docker push $(CONTAINER)

clean:
	docker rmi $(CONTAINER)


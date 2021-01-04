TARGET := code
CMD := bash

all: run

cntr: cntr/Dockerfile
	docker build . -t $@ -f cntr/Dockerfile

.PHONY: run
run: cntr
	docker run -i -t --rm --pid=host --privileged=true -v /var/run/docker.sock:/var/run/docker.sock cntr attach $(TARGET) $(CMD)


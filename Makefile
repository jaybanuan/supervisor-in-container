.PHONY build:
build:
	docker buildx build \
		--tag trivialserver \
		.


.PHONY run:
run:
	docker container run \
		--name trivialserver \
		--detach \
		--publish 80:80 \
		--publish 8080:8080 \
		trivialserver


.PHONY test:
test:
	curl http://localhost:80 | jq
	curl http://localhost:8080 | jq


.PHONY clean:
clean:
	docker container rm -f trivialserver

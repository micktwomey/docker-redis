TAG=micktwomey/redis
VOLUMES=-v /data/redis/logs:/redis/logs:rw -v /data/redis/db:/redis/db:rw

build:
	docker build -t $(TAG) .

shell:
	docker run $(VOLUMES) -i -t -u root --entrypoint="/bin/bash" $(TAG) -i

run:
	docker run $(VOLUMES) -P -d $(TAG)

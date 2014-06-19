IMAGE=micktwomey/redis
TAG=$(IMAGE):2.8.11-2
TAG_LATEST=$(IMAGE):latest
VOLUMES=-v /data/redis/logs:/redis/logs:rw -v /data/redis/db:/redis/db:rw

build:
	docker build -t $(TAG) .
	docker tag $(TAG) $(TAG_LATEST)

shell:
	docker run $(VOLUMES) -i -t -u root --entrypoint="/bin/bash" $(TAG) -i

run:
	docker run $(VOLUMES) -P -d $(TAG)

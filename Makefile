IMAGE_TAG?=

ifeq ($(IMAGE_TAG),)
IMAGE_TAG=latest
endif

.PHONY: image
image:
	echo $$RANDOM > src/sometoken
	docker build -t quay.io/jannfis/test-image:$(IMAGE_TAG) -f Dockerfile .

push:
	docker push quay.io/jannfis/test-image:$(IMAGE_TAG)

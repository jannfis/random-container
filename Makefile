IMAGE_REGISTRY?=quay.io
IMAGE_NAME?=test-image
IMAGE_NAMESPACE?=jannfis
IMAGE_TAG?=

ifeq ($(IMAGE_TAG),)
IMAGE_TAG=latest
endif

.PHONY: image
image:
	echo $$RANDOM > src/sometoken
	docker build -t $(IMAGE_REGISTRY)/$(IMAGE_NAMESPACE)/$(IMAGE_NAME):$(IMAGE_TAG) -f Dockerfile .

push:
	docker push $(IMAGE_REGISTRY)/$(IMAGE_NAMESPACE)/$(IMAGE_NAME):$(IMAGE_TAG)

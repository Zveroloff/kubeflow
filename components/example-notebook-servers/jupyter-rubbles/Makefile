TAG ?= $(shell git describe --tags --always --dirty)
REGISTRY ?= cr.yandex/crpjv1n273nttlibnqod

docker-build-jupyter:
	$(MAKE) docker-build -C ../jupyter TAG=${TAG} 

docker-build: docker-build-jupyter
	docker build -t ${REGISTRY}/jupyter-rubbles:${TAG} --build-arg BASE_IMG=${REGISTRY}/jupyter:${TAG} -f Dockerfile . 

docker-push:
	docker push ${REGISTRY}/jupyter-rubbles:${TAG}

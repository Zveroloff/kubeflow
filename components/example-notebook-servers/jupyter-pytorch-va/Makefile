TAG ?= $(shell git describe --tags --always --dirty)
REGISTRY ?= kubeflownotebookswg

docker-build-jupyter-pytorch-full-cuda:
	$(MAKE) docker-build-cuda -C ../jupyter-pytorch-full TAG=${TAG} 

docker-build-cuda: docker-build-jupyter-pytorch-full-cuda
	docker build -t ${REGISTRY}/jupyter-pytorch-cuda-va:${TAG} --build-arg BASE_IMG=${REGISTRY}/jupyter-pytorch-cuda-full:${TAG} -f cuda.Dockerfile . 

docker-push-cuda:
	docker push ${REGISTRY}/jupyter-pytorch-cuda-va:${TAG}

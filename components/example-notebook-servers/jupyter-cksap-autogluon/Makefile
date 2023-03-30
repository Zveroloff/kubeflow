TAG ?= $(shell git describe --tags --always --dirty)
REGISTRY ?= kubeflownotebookswg

docker-build-jupyter-pytorch:
	$(MAKE) docker-build-cpu -C ../jupyter-pytorch TAG=${TAG} 

docker-build-jupyter-pytorch-cuda:
	$(MAKE) docker-build-cuda -C ../jupyter-pytorch TAG=${TAG} 

docker-build-cpu: docker-build-jupyter-pytorch
	docker build -t ${REGISTRY}/jupyter-cksap-autogluon:${TAG} --build-arg BASE_IMG=${REGISTRY}/jupyter-pytorch:${TAG} -f cpu.Dockerfile . 

docker-build-cuda: docker-build-jupyter-pytorch-cuda
	docker build -t ${REGISTRY}/jupyter-cksap-cuda-autogluon:${TAG} --build-arg BASE_IMG=${REGISTRY}/jupyter-pytorch-cuda:${TAG} -f cuda.Dockerfile . 

docker-push-cpu:
	docker push ${REGISTRY}/jupyter-cksap-autogluon:${TAG}

docker-push-cuda:
	docker push ${REGISTRY}/jupyter-cksap-cuda-autogluon:${TAG}

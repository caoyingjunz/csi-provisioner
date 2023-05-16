.PHONY: run build image push clean

tag = v0.1
releaseName = csi-provisioner
dockerhubUser = jacky06

image:
	docker build -t $(dockerhubUser)/$(releaseName):$(tag) .

push:
	docker push $(dockerhubUser)/$(releaseName):$(tag)

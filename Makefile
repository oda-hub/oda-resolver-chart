IMAGE?=cdcihn.isdc.unige.ch:443/tnr

build: Dockerfile
	docker build -t $(IMAGE) .

push: build
	docker push $(IMAGE)


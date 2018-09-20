IMAGE?=tnr

build: Dockerfile
	docker build -t $(IMAGE) .


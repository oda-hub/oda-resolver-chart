IMAGE?=cdcihn.isdc.unige.ch:443/tnr:$(shell git describe  --tags --always)

build: Dockerfile
	docker build -t $(IMAGE) .

push: build
	docker push $(IMAGE)

run: build
	docker run -e POLAR_GRB_DATA_CSV=/data/polar/polar_grbs.csv -e GCPROXY_SECRET_LOCATION=/secret -p 5000:5000 -v $(PWD)/secret:/secret -v $(PWD)/data:/data:ro $(IMAGE)



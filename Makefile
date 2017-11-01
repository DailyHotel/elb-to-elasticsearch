BIN=elb-to-elasticsearch
IMAGE=dailyhotel/$(BIN)

image: 
	docker build -t $(IMAGE):latest .
	docker build -t $(IMAGE):s3-to-kafka ./s3-to-kafka/
	docker build -t $(IMAGE):kafka-to-es ./kafka-to-es/
	
deploy: image
	docker push $(IMAGE):latest
	docker push $(IMAGE):s3-to-kafka
	docker push $(IMAGE):kafka-to-es

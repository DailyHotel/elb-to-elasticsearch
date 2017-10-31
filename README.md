# elb-to-elasticsearch

Fluentd Docker image, which ships AWS ELB/ALB logs to Elasticsearch.

## Kubernetes usages

``` yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: elb-logshipper
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: elb-logshipper
    spec:
      containers:
      - image: dailyhotel/elb-to-elasticsearch:latest
        imagePullPolicy: Always
        name: elb-logshipper
        env:
          - name: AWS_ACCESS_KEY_ID
            value: MY_KEY
          - name: AWS_SECRET_ACCESS_KEY
            value: MY_SECRET
          - name: AWS_REGION
            value: ap-northeast-1
          - name: AWS_S3_BUCKETNAME
            value: my-access-logs
          - name: AWS_S3_PREFIX
            value: dev
          - name: ES_HOSTNAME
            value: my.es.io
          - name: ES_USERNAME
            value: fluentd
          - name: ES_PASSWORD
            value: MY_PASSWORD
          - name: ES_PORT
            value: "9243"
          - name: ES_SCHEME
            value: https
```


## See 

- [shinsaka/fluent-plugin-elb-log
](https://github.com/shinsaka/fluent-plugin-elb-log)
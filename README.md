# docker-elasticsearch-aws

Ready to use lean (146MB) Elasticsearch Docker image ready for using within AWS EC2.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-elasticsearch-aws/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-elasticsearch-aws)

## Current software

* OpenJDK JRE 8u92
* Elasticsearch 2.3.5
* [AWS plug-in](https://www.elastic.co/guide/en/elasticsearch/plugins/current/cloud-aws.html)

## Pre-requisites

* EC2 credentials for reading EC2 tags
* EC2 tag key and tag value for identifying machines used in the cluster

## Run

Ready to use node for cluster `elasticsearch-default`:
```
docker run --name elasticsearch \
	--detach \
	--privileged \
	--volume /path/to/data_folder:/data \
	-e AWS_KEY=xxxxxxxxxxxx \
	-e AWS_SECRET=xxxxxxxxxxxx \
	-e TAG_KEY=xxxxxxxxxxxx \
	-e TAG_VALUE=xxxxxxxxxxxx \
	quay.io/pires/docker-elasticsearch-aws:2.3.5
```

Ready to use node for cluster `myclustername`:
```
docker run --name elasticsearch \
	--detach \
	--privileged \
	--volume /path/to/data_folder:/data \
	-e CLUSTER_NAME=myclustername \
	-e AWS_KEY=xxxxxxxxxxxx \
	-e AWS_SECRET=xxxxxxxxxxxx \
	-e TAG_KEY=xxxxxxxxxxxx \
	-e TAG_VALUE=xxxxxxxxxxxx \
	quay.io/pires/docker-elasticsearch-aws:2.3.5
```

Ready to use node for cluster `elasticsearch-default`, with 8GB heap allocated to Elasticsearch:
```
docker run --name elasticsearch \
	--detach \
	--privileged \
	--volume /path/to/data_folder:/data \
	-e ES_HEAP_SIZE=8G \
	-e AWS_KEY=xxxxxxxxxxxx \
	-e AWS_SECRET=xxxxxxxxxxxx \
	-e TAG_KEY=xxxxxxxxxxxx \
	-e TAG_VALUE=xxxxxxxxxxxx \
	quay.io/pires/docker-elasticsearch-aws:2.3.5
```

**Master-only** node for cluster `elasticsearch-default`:
```
docker run --name elasticsearch \
	--detach \
	--privileged \
	--volume /path/to/data_folder:/data \
	-e NODE_DATA=false \
	-e HTTP_ENABLE=false \
	-e AWS_KEY=xxxxxxxxxxxx \
	-e AWS_SECRET=xxxxxxxxxxxx \
	-e TAG_KEY=xxxxxxxxxxxx \
	-e TAG_VALUE=xxxxxxxxxxxx \
	quay.io/pires/docker-elasticsearch-aws:2.3.5
```

**Data-only** node for cluster `elasticsearch-default`:
```
docker run --name elasticsearch \
	--detach \
	--privileged \
	--volume /path/to/data_folder:/data \
	-e NODE_MASTER=false \
	-e HTTP_ENABLE=false \
	-e AWS_KEY=xxxxxxxxxxxx \
	-e AWS_SECRET=xxxxxxxxxxxx \
	-e TAG_KEY=xxxxxxxxxxxx \
	-e TAG_VALUE=xxxxxxxxxxxx \
	quay.io/pires/docker-elasticsearch-aws:2.3.5
```

**Client-only** node for cluster `elasticsearch-default`:
```
docker run --name elasticsearch \
	--detach \
	--privileged \
	--volume /path/to/data_folder:/data \
	-e NODE_MASTER=false \
	-e NODE_DATA=false \
	-e AWS_KEY=xxxxxxxxxxxx \
	-e AWS_SECRET=xxxxxxxxxxxx \
	-e TAG_KEY=xxxxxxxxxxxx \
	-e TAG_VALUE=xxxxxxxxxxxx \
	quay.io/pires/docker-elasticsearch-aws:2.3.5
```

### Environment variables

* [CLUSTER_NAME](https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-configuration.html#cluster-name)
* [NODE_MASTER](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-node.html#master-node)
* [NODE_DATA](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-node.html#data-node)
* [NETWORK_HOST](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-network.html#common-network-settings)
* [HTTP_ENABLE](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-http.html#_settings_2)
* [HTTP_CORS_ENABLE](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-http.html#_settings_2)
* [HTTP_CORS_ALLOW_ORIGIN](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-http.html#_settings_2)

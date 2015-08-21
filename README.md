# docker-elasticsearch-aws

Ready to use lean (211MB) Elasticsearch Docker image ready for using within AWS EC2.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-elasticsearch-aws/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-elasticsearch-aws)

## Current software

* Oracle JRE 8 Update 51
* Elasticsearch 1.7.1
* AWS plug-in 2.7.0

## Pre-requisites

* Docker 1.7.0+
* EC2 credentials for reading EC2 tags
* EC2 tag key and tag value for identifying machines used in the cluster

## Run

Ready to use node for cluster `elasticsearch-default`:
```
docker run --name elasticsearch \
	--detach \
	--volume /path/to/data_folder:/data \
	-e AWS_KEY=xxxxxxxxxxxx \
	-e AWS_SECRET=xxxxxxxxxxxx \
	-e TAG_KEY=xxxxxxxxxxxx \
	-e TAG_VALUE=xxxxxxxxxxxx \
	quay.io/pires/docker-elasticsearch-aws:1.7.1-3
```

Ready to use node for cluster `myclustername`:
```
docker run --name elasticsearch \
	--detach \
	--volume /path/to/data_folder:/data \
	-e CLUSTER_NAME=myclustername \
	-e AWS_KEY=xxxxxxxxxxxx \
	-e AWS_SECRET=xxxxxxxxxxxx \
	-e TAG_KEY=xxxxxxxxxxxx \
	-e TAG_VALUE=xxxxxxxxxxxx \
	quay.io/pires/docker-elasticsearch-aws:1.7.1-3
```

Ready to use node for cluster `elasticsearch-default`, with 8GB heap allocated to Elasticsearch:
```
docker run --name elasticsearch \
	--detach \
	--volume /path/to/data_folder:/data \
	-e ES_HEAP_SIZE=8G \
	-e AWS_KEY=xxxxxxxxxxxx \
	-e AWS_SECRET=xxxxxxxxxxxx \
	-e TAG_KEY=xxxxxxxxxxxx \
	-e TAG_VALUE=xxxxxxxxxxxx \
	quay.io/pires/docker-elasticsearch-aws:1.7.1-3
```

**Master-only** node for cluster `elasticsearch-default`:
```
docker run --name elasticsearch \
	--detach \
	--volume /path/to/data_folder:/data \
	-e NODE_DATA=false \
	-e HTTP_ENABLE=false \
	-e AWS_KEY=xxxxxxxxxxxx \
	-e AWS_SECRET=xxxxxxxxxxxx \
	-e TAG_KEY=xxxxxxxxxxxx \
	-e TAG_VALUE=xxxxxxxxxxxx \
	quay.io/pires/docker-elasticsearch-aws:1.7.1-3
```

**Data-only** node for cluster `elasticsearch-default`:
```
docker run --name elasticsearch \
	--detach --volume /path/to/data_folder:/data \
	-e NODE_MASTER=false \
	-e HTTP_ENABLE=false \
	-e AWS_KEY=xxxxxxxxxxxx \
	-e AWS_SECRET=xxxxxxxxxxxx \
	-e TAG_KEY=xxxxxxxxxxxx \
	-e TAG_VALUE=xxxxxxxxxxxx \
	quay.io/pires/docker-elasticsearch-aws:1.7.1-3
```

**Client-only** node for cluster `elasticsearch-default`:
```
docker run --name elasticsearch \
	--detach \
	--volume /path/to/data_folder:/data \
	-e NODE_MASTER=false \
	-e NODE_DATA=false \
	-e AWS_KEY=xxxxxxxxxxxx \
	-e AWS_SECRET=xxxxxxxxxxxx \
	-e TAG_KEY=xxxxxxxxxxxx \
	-e TAG_VALUE=xxxxxxxxxxxx \
	quay.io/pires/docker-elasticsearch-aws:1.7.1-3
```


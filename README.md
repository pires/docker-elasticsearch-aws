# This project is no longer maintained

As of November 7th, 2018, I've decided to end my commitment to maintaining this repo and related.

It's been 3 years since I last used Elasticsearch, so I no longer have the motivation it takes to maintain and evolve this project. Also, other projects need all the attention I can give.

It was a great run, **thank you all**.

# docker-elasticsearch-aws

Ready to use lean (147MB) Elasticsearch Docker image ready for using within AWS EC2.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-elasticsearch-aws/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-elasticsearch-aws)

## Current software

* OpenJDK JRE 8u92
* Elasticsearch 2.4.1
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
	quay.io/pires/docker-elasticsearch-aws:2.4.1
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
	quay.io/pires/docker-elasticsearch-aws:2.4.1
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
	quay.io/pires/docker-elasticsearch-aws:2.4.1
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
	quay.io/pires/docker-elasticsearch-aws:2.4.1
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
	quay.io/pires/docker-elasticsearch-aws:2.4.1
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
	quay.io/pires/docker-elasticsearch-aws:2.4.1
```

### Environment variables

This image can be configured by means of environment variables.

Besides the [inherited ones](https://github.com/pires/docker-elasticsearch), this container image provides the following:

* *AWS_KEY*
* *AWS_SECRET*
* *TAG_KEY*
* *TAG_VALUE*

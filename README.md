# docker-elasticsearch-aws
Ready to use Elasticsearch + AWS plug-in Docker image.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-elasticsearch-aws/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-elasticsearch-aws)

## Current software

* Oracle JRE 8 Update 51
* Elasticsearch 1.7.0
* AWS plug-in 2.6.0

## Pre-requisites

* Docker 1.5.0+

## Run

You need a folder named `config` with your own version of `elasticsearch.yml`. You can add other Elasticserach configuration files to this folder, such as `logging.yml`.

```
docker run --rm -v /path/to/config:/elasticsearch/config -e ES_HEAP_SIZE=512M quay.io/pires/docker-elasticsearch-aws:1.7.0
```

In case you want to specify a data folder so that Elasticsearch writes to storage outside the container, run
```
docker run --rm -v /path/to/config:/elasticsearch/config -v /path/to/data_folder:/data -e ES_HEAP_SIZE=512M quay.io/pires/docker-elasticsearch-aws:1.7.0
```

**Attention**, change `ES_HEAP_SIZE` to match your environment resources.

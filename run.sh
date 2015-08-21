#!/bin/sh

export CLUSTER_NAME=${CLUSTER_NAME:-elasticsearch-default}
export NODE_MASTER=${NODE_MASTER:-true}
export NODE_DATA=${NODE_DATA:-true}
export HTTP_ENABLE=${HTTP_ENABLE:-true}
export MULTICAST=${MULTICAST:-false}

export AWS_KEY=${AWS_KEY:-myawskey}
export AWS_SECRET=${AWS_SECRET:-myawssecret}
export TAG_KEY=${TAG_KEY:-somekey}
export TAG_VALUE=${TAG_VALUE:-somevalue}

/elasticsearch/bin/elasticsearch

# Copy run script
COPY run.sh /
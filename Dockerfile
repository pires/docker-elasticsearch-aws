FROM quay.io/pires/docker-elasticsearch:2.4.1

MAINTAINER pjpires@gmail.com

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
RUN /elasticsearch/bin/plugin install cloud-aws

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Set environment
ENV AWS_KEY myawskey
ENV AWS_SECRET myawssecret
ENV TAG_KEY somekey
ENV TAG_VALUE somevalue

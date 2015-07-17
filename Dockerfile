FROM quay.io/pires/docker-elasticsearch:1.7.0

MAINTAINER pjpires@gmail.com

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
RUN /elasticsearch/bin/plugin -i elasticsearch/elasticsearch-cloud-aws/2.6.0 \
    && /elasticsearch/bin/plugin -i elasticsearch/marvel/latest

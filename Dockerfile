# The only point of this Dockerfile is to provide a very simple default
# set up for Prometheus.  The intent is this local config added here
# will be overwritten by a dedicate data volume mount in a production 
# setting.
FROM prom/prometheus 
MAINTAINER Boyd Hemphill <boyd@stackengine.com>

ADD base-config.yml /stackengine/prom-config.yml

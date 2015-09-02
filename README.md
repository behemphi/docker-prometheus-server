# Purpose

The `docker-prometheus` repository is meant to support an introduction
to the [Prometheus](http://prometheus.io) monitoring tool described in [this 
blog post](http://stackengine.com/?p=1117).

Additionally this repo provides code for a way to provide both default and 
dynamic configuration to a Docker container.

# Usage

You can run this container out of the box to simply play with the Prometheus
UI. More interesting however is using the dedicated configuration container 
[found here](https://github.com/behemphi/docker-prometheus-server-config) 
to create look at container metrics.

## Default Config

The `prom/prometheus` container is extended with a simple configuration that 
is meant to show the service is up and allow an exploration of the GUI.

To run this container you need only execute the command:


```
docker run \
    --detach \
    --name prom-server \
    --publish 9778:9090 \
    behemphi/prometheus \
        -config.file=/prom-config.yml
```

You can explore the basics of the Prometheus UI now by going to 
`http://nodeIP:9778`.  Check the above referenced blog for more detail.

Note: The host port is changed because 9090 is too common a choice for web apps.


## Using the Dedicated Config Container

Prometheus keeps a list of nodes it is polling in its configuraiton file.  
This makes for an extremely volatile config in an environment of any size. 

The approach here takes the view that hosts are stabe enough that the config
file can be managed through source control. 

Because there are two containers needed to run Prometheus start the server
with `docker-compose`:

```
docker-compose up -d 
```

If you are cycling quickly as you play around, it's a good idea to use the 
`--force-recreate` flag as well. 


# Volatile Hosts

If your particular situation is such that hosts are volatile then we recommend
a solution with `confd`.  Pull requests are welcome if you would like to 
add such a solution to this repo!

# Warnings

Three are a number of strong assumptions here about ports, names and the like.
Please play all you like, improve with pull requests, etc.  But understand 
that, for now, the purpose is to provide you a template for getting started.

# License

MIT

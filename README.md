## DataStax OpsCenter docker image

Docker image for running Opscenter 5.2.2. It is based on the official java:8

Running it:

```
docker run -d --name opscenter sagent/opscenter:latest
```

Expose some ports (or use `--net=host`):
```
docker run -d --name opscenter -p 8888:8888 -p 61620:61620 sagent/opscenter:latest
```

DataStax OpsCenter is a web-based visual management and monitoring solution for Apache Cassandra™ and DataStax Enterprise. OpsCenter provides architects, DBAs, and operations staff with the capabilities necessary to intelligently and proactively ensure their databases are running well and simplifies administration tasks.
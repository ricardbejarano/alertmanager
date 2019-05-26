<p align=center><img src=https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/198/police-cars-revolving-light_1f6a8.png width=120px></p>
<h1 align=center>alertmanager (container image)</h1>
<p align=center>The simplest container image of the official Prometheus <a href=https://github.com/prometheus/alertmanager>alertmanager</a></p>


## Tags

### Docker Hub

Available on [Docker Hub](https://hub.docker.com) as [`ricardbejarano/alertmanager`](https://hub.docker.com/r/ricardbejarano/alertmanager):

- [`0.17.0`, `master`, `latest` *(Dockerfile)*](https://github.com/ricardbejarano/alertmanager/blob/master/Dockerfile)

### Quay

Available on [Quay](https://quay.io) as [`quay.io/ricardbejarano/alertmanager`](https://quay.io/repository/ricardbejarano/alertmanager):

- [`0.17.0`, `master`, `latest` *(Dockerfile)*](https://github.com/ricardbejarano/alertmanager/blob/master/Dockerfile)


## Features

* Can't get any smaller (`~27.1MB`)
* Binary pulled from the official website
* Built `FROM scratch`, see the [Filesystem](#Filesystem) section below for an exhaustive list of the image's contents
* Reduced attack surface (no `bash`, no UNIX tools, no package manager...)


## Configuration

### Volumes

- Bind your **configuration file** at `/etc/alertmanager/alertmanager.yml`.


## Building

```bash
docker build -t alertmanager .
```


## Filesystem

The images' contents are:

```
/
├── alertmanager
├── data/
│   └── .keep
└── etc/
    ├── alertmanager/
    │   └── alertmanager.yml
    ├── group
    ├── passwd
    └── ssl/
        └── certs/
            └── ca-certificates.crt
```


## License

See [LICENSE](https://github.com/ricardbejarano/alertmanager/blob/master/LICENSE).

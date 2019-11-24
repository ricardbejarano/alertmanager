<p align="center"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/198/police-cars-revolving-light_1f6a8.png" width="120px"></p>
<h1 align="center">alertmanager (container image)</h1>
<p align="center">Built-from-source container image of Prometheus' <a href="https://github.com/prometheus/alertmanager">alertmanager</a></p>


## Tags

### Docker Hub

Available on [Docker Hub](https://hub.docker.com) as [`ricardbejarano/alertmanager`](https://hub.docker.com/r/ricardbejarano/alertmanager):

- [`0.19.0-glibc`, `0.19.0`, `glibc`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/alertmanager/blob/master/Dockerfile.glibc)
- [`0.19.0-glibc-arm`, `0.19.0-arm`, `glibc-arm`, `master-arm`, `latest-arm` *(Dockerfile.glibc-arm)*](https://github.com/ricardbejarano/alertmanager/blob/master/Dockerfile.glibc-arm)
- [`0.19.0-musl`, `musl` *(Dockerfile.musl)*](https://github.com/ricardbejarano/alertmanager/blob/master/Dockerfile.musl)
- [`0.19.0-musl-arm`, `musl-arm` *(Dockerfile.musl-arm)*](https://github.com/ricardbejarano/alertmanager/blob/master/Dockerfile.musl-arm)

### Quay

Available on [Quay](https://quay.io) as:

- [`quay.io/ricardbejarano/alertmanager-glibc`](https://quay.io/repository/ricardbejarano/alertmanager-glibc), tags: [`0.19.0`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/alertmanager/blob/master/Dockerfile.glibc)
- [`quay.io/ricardbejarano/alertmanager-glibc-arm`](https://quay.io/repository/ricardbejarano/alertmanager-glibc-arm), tags: [`0.19.0`, `master`, `latest` *(Dockerfile.glibc-arm)*](https://github.com/ricardbejarano/alertmanager/blob/master/Dockerfile.glibc-arm)
- [`quay.io/ricardbejarano/alertmanager-musl`](https://quay.io/repository/ricardbejarano/alertmanager-musl), tags: [`0.19.0`, `master`, `latest` *(Dockerfile.musl)*](https://github.com/ricardbejarano/alertmanager/blob/master/Dockerfile.musl)
- [`quay.io/ricardbejarano/alertmanager-musl-arm`](https://quay.io/repository/ricardbejarano/alertmanager-musl-arm), tags: [`0.19.0`, `master`, `latest` *(Dockerfile.musl-arm)*](https://github.com/ricardbejarano/alertmanager/blob/master/Dockerfile.musl-arm)


## Features

* Super tiny (about `27.1MB`)
* Compiled from source during build time
* Built `FROM scratch`, with zero bloat (see [Filesystem](#filesystem))
* Reduced attack surface (no shell, no UNIX tools, no package manager...)
* Runs as unprivileged (non-`root`) user


## Building

- To build the `glibc`-based image: `$ docker build -t alertmanager:glibc -f Dockerfile.glibc .`
- To build the `musl`-based image: `$ docker build -t alertmanager:musl -f Dockerfile.musl .`


## Configuration

### Volumes

- Mount your **data** at `/data`.
- Mount your **configuration** at `/alertmanager.yml`.


## Filesystem

```
/
├── alertmanager
├── data/
└── etc/
    ├── group
    ├── passwd
    └── ssl/
        └── certs/
            └── ca-certificates.crt
```


## License

See [LICENSE](https://github.com/ricardbejarano/alertmanager/blob/master/LICENSE).

<div align="center">
	<p><img src="https://em-content.zobj.net/thumbs/160/apple/325/fire_1f525.png" width="100px"></p>
	<h1>alertmanager</h1>
	<p>Built-from-source container image of <a href="https://github.com/prometheus/alertmanager">Alertmanager</a></p>
	<code>docker pull quay.io/ricardbejarano/alertmanager</code>
</div>


## Features

* Compiled from source during build time
* Built `FROM scratch`, with zero bloat
* Reduced attack surface (no shell, no UNIX tools, no package manager...)
* Runs as unprivileged (non-`root`) user


## Tags

### Docker Hub

Available on Docker Hub as [`docker.io/ricardbejarano/alertmanager`](https://hub.docker.com/r/ricardbejarano/alertmanager):

- [`0.26.0`, `latest` *(Dockerfile)*](Dockerfile)

### RedHat Quay

Available on RedHat Quay as [`quay.io/ricardbejarano/alertmanager`](https://quay.io/repository/ricardbejarano/alertmanager):

- [`0.26.0`, `latest` *(Dockerfile)*](Dockerfile)


## Configuration

### Volumes

- Mount your **data** at `/data`.
- Mount your **configuration** at `/alertmanager.yml`.

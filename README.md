# Dockerized Datomic

This repository contains a Dockerfile for running Datomic in a Docker container.

## Usage

Pass your configuration options to [postgres-transactor.properties](postgres-transactor.properties), which connects to the postgres backend to store the data from the datomic instance.

Then, build the image:

```bash
docker build -t datomic .
```

## Example Scenarios

We use this image as a backend of https://app.schnaq.com. It is installed on a Kubernetes cluster and is used to store the data of the application.

## License
Copyright © 2024 – today schnaq GmbH and Contributors

Distributed under the [MIT](LICENSE) License.

# api-build-scripts
Build scripts used in DevOps Pipleline

## Table of Content

- [About](#about)
- [Project Structure](#project-structure)
- [API Health Checker](#api-health-checker)

## About
This repo contains scripts used for CI/CD DevOps Build Pipelines for API Development. It is referenced by my NestJS Example project here [https://github.com/LoganRupe/nestjs-example]() within the Azure DevOps Pipeline (`azure-pipelines.yml`).

````
* /API_health_checker.sh                            # API Health Checker script for Linux Build Machines
...
````

## API Health Checker
The API Health Checker scripts objective is to verify an API is healthy before returning success. This is useful in the scenario where you are starting a docker image that runs an API but don't want other processes to start till the API is functioning. 

The API Health Checker scripts allow for two command line arguments, the URL to the health check for the API (e.g. http://host.docker.internal/health) and the timeout period in seconds (e.g. 60). 

~~So for Windows this would be:~~

```powershell
# Windows Build Machines now have BASH installed. See below.
```

And for Linux this would be:

```bash
# Run API Health Check against local docker container and timeout after a minute.
./API_health_checker.sh http://host.docker.internal/health 60
```
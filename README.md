[![CircleCI](https://circleci.com/gh/MarcosX/exercism-track.svg?style=svg)](https://circleci.com/gh/MarcosX/exercism-track)

# Tracking exercises for [exercism.io](http://exercism.io)

Currently working on: [crystal](https://crystal-lang.org)

## Local development

Use the `Makefile` to run all tests for all languages or use the language specific tasks if you wanna run just a sigle language, examples:

```bash
# run all tests
make test

# run specific test
make test-elixir

# run tests using the docker image
make docker-test
```

Alternatively you can use the docker image at [dockerhub](https://hub.docker.com/r/marcosx/exercism.io/) and create a volume so local changes are synced.

Do a `docker pull marcosx/exercism.io` and then run `docker run -v ~/exercism:/exercism -it exercism.io` so local changes are synced. The default command will run `make test`.

## Developing with Docker

Use the `Dockerfile` to build and run an Ubuntu container with all languages installed.

Run `docker build -t marcosx/exercism.io .` to build the image.

Then `docker run --name exercism.io_instance -it marcosx/exercism.io` to run all tests.


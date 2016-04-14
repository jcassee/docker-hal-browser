Docker hal-browser image
========================

This project contains a Docker image for running [hal-browser](https://github.com/mikekelly/hal-browser).


## Usage

Set the `ENTRY_POINT` environment variable to the root resource of the API:

    docker run -e ENTRY_POINT=http://api.example.com/ jcassee/hal-browser

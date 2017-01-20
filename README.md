# Brute Force Login App

This is a simple login app that has a brute-force vulnerability. Along with the [picoCTF definition][1], it can be used for capture-the-flag competitions.

## Running locally

The app runs in a Docker container. You first need to build the image locally
by running `docker build -t rubenarakelyan/ctf-brute-force-vm:v1 .` inside
the local copy of your repository.

Once the image has been built, you can launch a container by running
`docker run -tiP rubenarakelyan/ctf-brute-force-vm:v1 /bin/bash`.
Remember to run `service nginx start` in the container to get
everything running.

If you're launching the container from a service that automatically handles
Docker containers, nginx should run automatically once the container has been
launched.

## Accessing the login app

Once the container is running, it exposes the login app over a random local
port, which you can find by running `docker ps` and inspecting the output.
For example, if the app has been exposed on port 32788, then you can access
it at `http://127.0.0.1:32788` from the host machine.

## Licence

[MIT License](LICENSE)

[1]: https://github.com/rubenarakelyan/ctf-brute-force-problem

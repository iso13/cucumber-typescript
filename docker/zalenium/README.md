# Zalenium

Main features of zalenium are video recording of all tests and autoscaling of the selenium nodes.

All documentation in https://github.com/zalando/zalenium

## Install Docker

1.  Create Docker account https://hub.docker.com/

2.  Install Docker Desktop. Follow installation instructions for your platform - https://docs.docker.com/install/

    2.1. MAC: https://docs.docker.com/docker-for-mac/install/

    2.2. Windows: TBD

## Set up

Open Zalenium project github page https://github.com/zalando/zalenium. Follow the "Getting Started" instructions:

1.  Make sure your Docker-engine running

2.  Download the latest `docker-selenium` and `Zalenium` images

        docker pull elgalu/selenium

        docker pull dosel/zalenium

## Run

1.  From `limelighte2e` root folder run the command

        docker run --rm -ti --name zalenium -p 4444:4444 \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v $(pwd)/docker/zalenium/videos:/home/seluser/videos \
        --privileged dosel/zalenium start

2.  List of useful links to manage your test run. You can open them using your browser:

    2.1. Grid Console - http://localhost:4444/grid/console

    2.2. Zalenium Dashboard - http://localhost:4444/dashboard/

    2.3. Zalenium Live Preview - http://localhost:4444/grid/admin/live

3.  Use command to stop it:

        docker stop zalenium

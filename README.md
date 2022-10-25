# Djedi's Django Starter

This is a work in progress, but should be usable now if you understand what you're doing. These are my opinionated preferences when starting a new app. If you have suggestions I'm certainly open to them. Feel free to submit a pull request.

## Setup

1. Clone this repo.

   ```shell
   git clone https://github.com/djedi/django-starter.git websitename
   cd websitename
   ```

1. Run setup script.

   ```shell
   ./setup.sh
   ```

## Database

Dev is set to use the docker instance of postgres. You can start it up by running:

```shell
docker-compose up db -d
```

You will need to migrate and add a super user:

```shell
./manage.py migrate
./manage.py createsuperuser
```

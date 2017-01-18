# aljp Django Cookiecutter

A foundation to get a django project started quickly.

# Whats included?

Vagrant and Docker for the local development environment because Vagrant works well across different operating systems (like windows).  These servers are run as docker containers within the vagrant machine and orchestrated through the docker-compose.yml file, inspired by [12Factor](https://12factor.net/) [Dev/Production parity](https://12factor.net/dev-prod-parity)

By default it is configured to only run a postgres server, a django web server, and a mailcatcher server.

If you would like to run a redis server for a cache, or a celery worker with redis and amqp servers for the broker and result backend, then you should put in "y" for the appropriate cookiecutter arguments.  More details on the options accept by this Cookiecutter template follow in the Cookiecutter section.


# Cookiecutter

[Cookiecutter is a command-line utility that creates projects from cookiecutters (project templates).](https://github.com/audreyr/cookiecutter)  Install Cookiecutter and proceed using the command `cookiecutter aljp_django_cookiecutter`.

```
~ $ cookiecutter https://github.com/aljp/aljp_django_cookiecutter
project [my_django_project]: 
secret_key []:
vagrant_ip [192.168.56.101]: 
dev_domain [192.168.56.101]: 
cache [n]: 
celery [n]: 
```

 - The **project** name will be be used to fill in the Django project folder and should contain only letters, numbers and underscores.
 - You will need to provide a suitable random value for the **secret_key** used by Django.
 - The **vagrant_ip** is the private network address used by the vagrant virtual machine.
 - The **dev_domain** is an alias to the vagrant ip from the host machine e.g. my_django_project.dev.  You will need to edit your hosts file if you customise this.  
 - If you type _y_ for the **cache** value then a redis container will be included in the vagrant machine and a default cache entry will be added to the default settings using the first database on the redis server.
 - If you type _y_ for the **celery** value then a redis container, amqp container, celery container, and beat container will be included in the vagrant machine.  A "celery" cache entry will be added to the default settings using the second database on the redis server.

# Notes

Laptop users... if you enable all the features then this setup is quite demanding, hence why the Vagrantfile allocates 2cpu cores and 2gb of ram.

# Contributing

Feel free to contribute to the repo by making a fork and submitting a pull request documenting your changes. 

If you notice any issues please feel free to create an issue in github.
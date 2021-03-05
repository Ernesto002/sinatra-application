# Sinatra Application

This is a Sinatra based TV show review app that includes all CRUD features with the following relationships:
![sinatra_flow](https://user-images.githubusercontent.com/73979053/110179164-724e7480-7dbc-11eb-9189-16aff11675c7.JPG)


## Installation 

Clone this repository and install all necessary gems

```bash
$ git clone git@github.com:Ernesto002/sinatra-application.git
$ bundle install
```

Migrate & Seed Database:

```bash
$ rake db:migrate
$ rake db:seed
```

## Execution

After installation run: 

```bash
$ rake db:migrate SINATRA_ENV=test
```
to migrate the testing database

To launch server run:

```bash
$ shotgun
```

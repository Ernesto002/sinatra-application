# Sinatra Application

This is a Sinatra based TV show review app that includes all CRUD features with the following relationships:


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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Ernesto002/sinatra-application. This project is intended to be a safe, welcoming space for collaboration, and contributers are expected to adhere to the [Code of Conduct](https://github.com/Ernesto002/sinatra-application/blob/master/CODE_OF_CONDUCT.md).

## License 

This code is available as open source under this [LICENSE](https://github.com/Ernesto002/sinatra-application/blob/master/LICENSE).

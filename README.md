# Mobile App Promotion

A Sinatra (Ruby) app showing how to implement mobile app promotion using the Nexmo SMS API.

## Prerequisites

* [A Nexmo account](https://dashboard.nexmo.com/sign-up)
* [Ruby 2.1+](https://www.ruby-lang.org/) and [Bundler](http://bundler.io/)

## Getting started

```sh
# clone this repository
git clone git@github.com:Nexmo/ruby-mobile-app-promotion.git
# change to folder
cd ruby-mobile-app-promotion
# install dependencies
bundle install
# create a .env
cp .env.example .env
```

Next you will need to sign up for a Nexmo account and get your API credentials from the API dashboard and put them in your `.env`
file.

Finally all that's left is to start the server.

```sh
ruby app.rb
```

## Usage

This app shows you how to login a user using [Sinatra](http://www.sinatrarb.com/), Ruby and [Nexmo Verify](https://www.nexmo.com/products/verify/).

Once your server is started:

* Visit [localhost:4567](http://localhost:4567/)

## License

This project is licensed under the [MIT license](LICENSE).

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

Then you can start the server.

```sh
ruby app.rb
```

Finally make sure your application is available from a phone. For this you will need a public IP on your development machine, or you could use a tool like [ngrok](https://ngrok.com/).

## Usage

This app shows you how to send an SMS to
mobile phone with a download link for your
application. This app uses [Sinatra](http://www.sinatrarb.com/),
Ruby and the [Nexmo SMS](https://www.nexmo.com/products/sms/) API.

Once your server is started:

* Your server is available on port `4567`
* Ensure your server is available to other devices either locally or with a tool like [ngrok](https://ngrok.com/).
* Visit your servers root URL on a desktop browser
* Select "Get it via SMS message"
* Fill in your phone number without any leading 0's or +'s (e.g. `445555666777`)
* You will receive an sms in seconds, follow the link in the SMS and download the app.

As this is a very simple starter app this app only supports iOS and Android. It does show you how to ensure the SMS was sent successfully and how to catch any errors that may occur when sending an SMS.

## License

This project is licensed under the [MIT license](LICENSE).

require 'sinatra'

# load environment variables
# from .env file
require 'dotenv'
Dotenv.load

# nexmo library
require 'nexmo'
nexmo = Nexmo::Client.new(
  key: ENV['NEXMO_API_KEY'],
  secret: ENV['NEXMO_API_SECRET']
)

# specify a default layout
set :erb, layout: :layout

# Index
# - shows our app's website
#
get '/' do
  erb :index
end

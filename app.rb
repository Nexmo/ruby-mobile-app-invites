# web server and flash messages
require 'sinatra'
require 'rack-flash'
use Rack::Flash

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

# enable sessions and set the
# session secret
enable :sessions
set :session_secret, '123456'

# specify a default layout
set :erb, layout: :layout

URLS = {
  android: "https://play.google.com/store/apps/details?id=com.imdb.mobile",
  ios: "https://geo.itunes.apple.com/us/app/google-official-search-app/id284815942"
}

# determine the browser
require 'browser'
before do
  @browser ||= Browser.new(
    request.user_agent,
    accept_language: "en-us"
  )
end

# Index
# - shows our landing page
#   with links to download
#   from the app stores or
#   via SMS
#
get '/' do
  erb :index
end


# Download page
# - a page where the user
#   fills in their phone
#   number in order to get a
#   download link
#
get '/download' do
  erb :download
end

# Send SMS
# - when submitted this action
#   sends an SMS to the user's
#   phone number with a download
#   link
#
post '/send_sms' do
  message = "Download our app on #{url('/')}"

  response = nexmo.send_message(
    from: 'My App',
    to: params[:number],
    text: message
  )['messages'].first

  if response['status'] == '0'
    flash[:notice] = 'SMS sent'
    redirect '/'
  else
    flash[:error] =
      response['error-text']
      erb :download
  end

end

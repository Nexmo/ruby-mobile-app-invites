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

# determine the browser and platform
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
#   fills in a phone number
#   and a name in order to
#   send a download link
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
  name = params[:name]
  message = "#{name} invites you to download My App.\n\n #{url('/')}"

  # send the message
  response = nexmo.send_message(
    from: 'My App',
    to: params[:number],
    text: message
  )['messages'].first

  # verify the response
  if response['status'] == '0'
    flash[:notice] = 'SMS sent'
    redirect '/'
  else
    flash[:error] =
      response['error-text']
      erb :download
  end

end

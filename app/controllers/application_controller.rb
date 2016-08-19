require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, 'happy_dayz'
    end

    get '/' do
        erb :index
    end

    helpers do

        def current_user
            User.find(session[:id])
        end

        def logged_in?
            !!current_user
        end
        
    end

end

require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, 'tweetster'
    end

    helpers do

        def logged_in?
            !!@current_user
        end

        def current_user
            @current_user ||= User.find(session[:id])
        end

    end

    get '/' do
        erb :index
    end

end

require 'pry'

class UsersController < ApplicationController


    get '/users/sign_up' do
        erb :'users/sign_up'
    end

    post '/users' do
        user = User.create(params)
        session[:id] = user.id
        if user.save
            redirect to '/lists'
        else
            redirect to '/users/sign_up'
        end
    end

    # sign_in
    #
    # log_out


end

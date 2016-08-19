require 'pry'

class ListsController < ApplicationController

    get '/lists' do
        if logged_in?
            @lists = List.all
            erb :'lists/index'
        else
            redirect to '/users/sign_up'
        end
    end

    get '/lists/new' do
        erb :'lists/new'
    end

    get '/lists/:id' do
        @list = List.find(params[:id])
        if @list.user_id != current_user.id
            redirect to '/lists'
        else
            erb :'lists/show'
        end
    end

    post '/lists' do
        list = current_user.lists.create(params)
        if list.save
            redirect to '/lists'
        else
            redirect to '/lists/new'
        end
    end

    get '/lists/:id/edit' do
        @list = List.find(params[:id])
        erb :'lists/edit'
    end

    patch '/lists/:id' do
        @list = List.find(params[:id])
        @list.update(title: params[:title])
        if @list.save
            redirect to '/lists'
        else
            redirect to '/lists/#{@list.id}'
        end
    end

    delete '/lists/:id/delete' do
        list = List.find(params[:id])
        list.destroy
        redirect to '/lists'
    end



end

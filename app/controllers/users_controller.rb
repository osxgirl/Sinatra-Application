
class UsersController < ApplicationController
    
    get '/signup' do
        erb :"users/new.html"
    end

    get '/users' do
        @user = User.find_by(params[:email])
        erb :'users/show.html'
    end

    post '/users' do
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
        
            if @user.save
                redirect '/login'
            else
                erb :"users/new.html"
            end
        end
end

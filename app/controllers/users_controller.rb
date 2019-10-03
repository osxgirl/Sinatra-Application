
class UsersController < ApplicationController
    
    get '/signup' do
        erb :"users/new.html"
    end

<<<<<<< HEAD
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

=======
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

>>>>>>> fa78820d2fa12007ac2098212e63607e286fad2e
    get '/sessions/login' do
        if !logged_in?
            erb :"users/login"
        else
            redirect to "/posts"
        end
    end

end

class SessionsController < ApplicationController
    
  get '/login' do
    if !logged_in?
        erb :"sessions/login.html"
        else
            redirect to "/posts"
    end
  end

  post '/sessions' do
      login(params[:email], params[:password])
      redirect '/posts'
  end

  get '/logout' do
      logout!
      redirect '/login'
  end

end

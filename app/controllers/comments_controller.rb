class CommentsController < ApplicationController
    
    get '/comments' do
    if logged_in?
    @user = current_user
    @comments = Comment.all
    erb :'/comments/comments'
    else
    redirect to '/login'
end
end

get '/comments/new' do
    if !logged_in?
        redirect to "/login"
        else
        erb :"comments/create_comment"
    end
end

post '/comments' do
    if logged_in?
        if params[:content].empty?
            redirect to "/comments/new"
            else
            @comment = current_user.comments.create(content: params[:content])
            redirect to "/comments/#{@comment.id}"
        end
        else
        redirect to "/login"
    end
end

get '/comments/:id' do
    if logged_in?
        @comment = Comment.find_by(params[:id])
        erb :"comments/show_comment"
        else
        redirect to "/login"
    end
end

get '/comments/:id/edit' do
    if !logged_in?
        redirect to "/login"
        else
        @comment = Comment.find_by(params[:id])
        
        if @comment && @comment.user == current_user
            erb :"comments/edit_comment"
            else
            redirect to "/comments"
        end
    end
end

patch '/comments/:id' do
    @comment = Comment.find(params[:id])
    if params[:content] != ""
        @comment.update(:content => params[:content])
        redirect to "/comments/#{@comment.id}"
        else
        redirect to "/comments/#{@comment.id}/edit"
    end
end


delete '/comments/:id/delete' do
    @current_user = User.find_by_id(session[:user_id])
    @comment = Comment.find_by_id(params[:id])
    if @current_user.comments.find_by_id(@comment.id)
        @comment.delete
    end
    
    redirect to '/comments'
end
end

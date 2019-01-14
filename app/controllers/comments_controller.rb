class CommentsController < ApplicationController
    
get '/comments' do
    if logged_in?
        #@user = current_user
        #@comments = Comment.all
        @comments = current_user.comments.all
        erb :"comments/comments"
    else
        redirect "/login"
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
get '/comments/new' do
    if logged_in?
        erb :"comments/create_comment"
        else
        redirect "/login"
    end
end

get '/comments/:id' do
    if logged_in?
        @comment = Comment.find(params[:id])
        erb :"comments/show_comment"
        else
        redirect "/login"
    end
end

get '/comments/:id/edit' do
    if logged_in?
        @comment = Comment.find(params[:id])
        erb :"comments/edit_comment"
        else
        redirect "/comments"
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

post '/comments:id' do
    @comment = Comment.find(params[:id])
    @comment.content = params[:content]
    if @comment.save
        erb :"comment/show"
        else
        redirect "comment/#{@comment.id}/edit"
    end
end

delete '/comments/:id/delete' do
    comment = Comment.find(params[:id])
    if comment.user == current_user
        Comment.destroy(params[:id])
    end
    redirect "/login"
end

end

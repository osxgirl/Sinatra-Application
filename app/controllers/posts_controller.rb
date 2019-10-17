class PostsController < ApplicationController
   
    get '/posts' do
        if logged_in?
        @posts = current_user.posts.all
        erb :"posts/posts"
        else
            redirect "/login"
        end
    end

    post '/posts' do
        if logged_in?
            if params[:content].empty?
                redirect to "/posts/new"
            else
                @post = current_user.posts.create(content: params[:content])
                redirect to "/posts/#{@post.id}"
            end
        else
            redirect to "/login"
        end
    end

    get '/posts/new' do
        if !logged_in?
            redirect "/login"
        else
            erb :"posts/create_post"
        end
    end

    get '/posts/:id' do
        if !logged_in?
            redirect "/login"
        else
            @post = Post.find(params[:id])
            erb :"posts/show_post"
        end
    end

    get '/posts/:id/edit' do
        @post = Post.find_by_id(params[:id])
        erb :"posts/edit"
    end

    patch '/posts/:id' do
            @post = Post.find_by_id(params[:id])
                if  @post.user == current_user
                    @post.content = params[:content]
                    @post.save
                    redirect to "/posts/#{@post.id}"
                else
                redirect to "/posts/#{@post.id}/edit"
        end
    end

    delete '/posts/:id/delete' do
        @post = Post.find(params[:id])
            if @post.user == current_user
                Post.destroy(params[:id])
            end
            redirect "/login"
    end

end

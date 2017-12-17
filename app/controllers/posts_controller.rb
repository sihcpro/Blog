class PostsController < ApplicationController
  def create
    @user = current_user
    render json:  if @user.nil?
                    { message: 'Invalid user', status: 404 }
                  else
                    @post = Post.new(user_id: @user.id, content: params[:postContent])
                    if @post.save
                      { id: @post.id, status: 202 }
                    else
                      { message: 'Forbidden', status: 403 }
                    end
                  end
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      render json: { message: 'Not found', status: 404 }
    else
      render json: { postContent: @post.content, name: @post.name, status: 200 }
    end

    # binding.pry
  end
end

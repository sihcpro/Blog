class PostsController < ApplicationController
  def create
    @user = current_user
    if @user.nil?
      render json: { message: 'Invalid user', status: 406 }
    else
      @post = Post.new(user_id: @user.id)
      
    end

    binding.pry
  end
end

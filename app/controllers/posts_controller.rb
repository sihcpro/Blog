class PostsController < ApplicationController
  def create
    @user = current_user
    @tag = params[:tagList]
    render json:  if @user.nil?
                    { message: 'Invalid user', status: 404 }
                  else
                    @post = Post.new(user_id: @user.id, content: params[:postContent])
                    if !@tag.nil? && @post.save
                      make_tag(@tag, @post.id)
                      { id: @post.id, status: 202 }
                    else
                      { message: 'Forbidden', status: 403 }
                    end
                  end
  end

  def show
    @post = Post.find_by(id: params[:id])
    render json:  if @post.nil?
                    # @all_tag =
                    { message: 'Not found', status: 404 }
                  else
                    { postContent: @post.content, name: @post.postname,
                      tag: @post.tags.select(:id, :tagname), status: 200 }
                  end
  end

  private

  def make_tag(tag, post_id)
    @tag = tag.split(',')
    @tag.each do |t|
      tag_id = if Tag.find_by(tagname: t).nil?
                 Tag.create(tagname: t).id
               else
                 Tag.find_by(tagname: t).id
               end
      TagPost.create(tag_id: tag_id, post_id: post_id)
    end
  end
end

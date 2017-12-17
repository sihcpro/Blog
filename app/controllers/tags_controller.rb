class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(tagname: params[:id])
    render json:  if @tag.nil?
                    { message: 'Not found', status: 404 }
                  else
                    { post: @tag.posts.select(:id, :content, :created_at), status: 200 }
                  end
  end
end

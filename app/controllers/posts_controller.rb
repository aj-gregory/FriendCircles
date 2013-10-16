class PostsController < ApplicationController

  def create
    params[:post][:user_id] = current_user.id
    @post = Post.new(params[:post])

    @post.links.new(params[:links].values)
    if @post.save
      redirect_to user_url(@post.user)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to user_url(@post.user)
    end
  end

end

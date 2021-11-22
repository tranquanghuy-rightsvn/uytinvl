class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def show 
    @post = Post.find_by(id: params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end
end


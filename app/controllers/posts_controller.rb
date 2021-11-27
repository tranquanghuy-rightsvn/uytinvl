class PostsController < ApplicationController
  before_action :set_post, only: %i(show edit update)

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save!
      redirect_to @post
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update! post_params
      redirect_to @post
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :image)
  end
end


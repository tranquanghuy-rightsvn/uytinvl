class PostsController < ApplicationController
  before_action :check_current_user, except: %i(index show)
  before_action :set_post, only: %i(show edit update)
  before_action :check_owner, only: %i(edit update)

  def index
    redirect_to root_path
  end

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
    @comments = @post.comments.includes(:user, parent_comment: :user).get_parents
  end

  def edit; end

  def update
    if @post.update post_update_params
      redirect_to @post
    else
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
    redirect_to root_path unless @post
  end

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :image, :channel_id, :hashtags)
  end

  def post_update_params
    params.require(:post).permit(:title, :content, :category_id, :image)
  end

  def check_owner
    redirect_to root_path unless @post.user_id == current_user.id
  end
end


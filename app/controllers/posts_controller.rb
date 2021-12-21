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

    ActiveRecord::Base.transaction do
      if @post.save
        params[:post][:tags].split(",").map do |tag_name|
          tag = Tag.find_or_create_by(name: tag_name.strip)
          TagsPost.find_or_create_by(tag_id: tag.id, post_id: @post.id)
        end

        redirect_to @post
      else
        render :new
      end
    end
  end

  def show
    @comments = @post.comments.includes(:user, parent_comment: :user).get_parents
  end

  def edit; end

  def update
    ActiveRecord::Base.transaction do
      if @post.update post_update_params
        @post.tags_posts.map do |tags_post|
          next if params[:post][:tags].split(",").map(&:strip).map(&:downcase).include?(tags_post.tag.name)

          tags_post.destroy!
        end

        params[:post][:tags].split(",").map do |tag_name|
          tag = Tag.find_or_create_by(name: tag_name.strip)
          TagsPost.find_or_create_by(tag_id: tag.id, post_id: @post.id)
        end
        redirect_to @post
      else
        render :edit
      end
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
    redirect_to root_path unless @post
  end

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :image, :channel_id, :tag)
  end

  def post_update_params
    params.require(:post).permit(:title, :content, :category_id, :image, :tag)
  end

  def check_owner
    redirect_to root_path unless @post.user_id == current_user.id
  end
end


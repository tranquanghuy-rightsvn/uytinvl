class HomeController < ApplicationController
  def index
    @posts = Post.newest.page(params[:page]).per(Settings.post.per_page)
  end
end

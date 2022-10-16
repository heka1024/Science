class PostsController < ApplicationController
  def index
    page = params[:page].to_i || 1
    @posts = Post.all.page(page)
    @next_page = page + 1 if (Post.all.count > 10 * page + 10)
  end

  def show
  end
end

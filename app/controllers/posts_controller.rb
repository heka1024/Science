class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  attr_reader :page

  def index
    @page = params[:page].to_i || 1
    @posts = Post.all.page(page)
    puts @posts
    @next_page = page + 1 if (Post.all.count > 10 * page + 10)
  end

  def show
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end

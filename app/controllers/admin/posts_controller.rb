class Admin::PostsController < ApplicationController
  before_action :authorize_admin!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      flash[:success] = "Post created!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages.join(".  ")
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post updated!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages.join(".  ")
      render :edit
    end
  end

  protected

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

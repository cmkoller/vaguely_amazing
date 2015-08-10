module Admin
  class PostsController < ApplicationController
    before_action :authorize_admin!
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

    protected

    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
end

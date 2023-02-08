class PostController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.where(author: @user)
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post: @post)
  end
end

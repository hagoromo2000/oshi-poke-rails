class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    posts = Post.all
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: { status: 'SUCCESS', message: 'Saved post', data: post }
    else
      render json: { status: 'ERROR', message: 'Post not saved', data: post.errors }
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :author_name, :image_url, :body)
  end
end
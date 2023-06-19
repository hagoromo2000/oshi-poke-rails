class PostsController < ApplicationController
  def index
    posts = Post.all.order(created_at: :desc).page(params[:page]).per(6) # 1ページあたり100件としています。
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
class PostsController < ApplicationController

  before_action :logged_in_user, except: [:blog]
  before_action :admin_user, except: [:blog]

  def blog
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 10)
  end

  def show

  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
  end
end

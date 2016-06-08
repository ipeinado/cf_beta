class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :new, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]
  before_action :get_user, only: [:show, :edit, :update, :destroy ]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  end

  def new
      @user = User.new
  end

  def create
      @user = User.new(user_params)
      @user.provider = "identity"
      @user.uid = (User.count + 1).to_s
      if @user.save
          log_in @user
          flash[:success] = I18n.t(:welcome_user, name: @user.name)
          redirect_to @user
      else
          render 'new'
      end
  end

  def edit
  end

  def update
      if @user.update_attributes(user_params)
          flash[:success] = I18n.t(:profile_updated)
          redirect_to @user
      else
          render 'edit'
      end
  end

  def destroy
      @user.destroy
      flash[:success] = I18n.t(:user_deleted, name: @user.name)
      redirect_to users_path
  end

  def create_user_from_twitter
    @user = User.from_tw_omniauth(request.env['omniauth.auth'])
    if @user.save
      flash[:success] = "Thanks for supporting the manifesto"
    else
      flash[:danger] = "Something went wrong"
    end    
    redirect_to manifiesto_path
  end

  def create_user_from_facebook
    @user = User.from_fb_omniauth(request.env['omniauth.auth'])
    if @user.save
      flash[:success] = "Thanks for supporting the manifesto"
    else
      flash[:danger] = "Something went wrong"
    end
    redirect_to manifiesto_path  
  end

  private

    def user_params
        params.require(:user).permit(:name, :email, :avatar, :remove_avatar, :twitter, :linkedin, :website, :bio, :password, :password_confirmation, :manifest_support, :provider, :uid)
    end

    def get_user
        @user = User.find(params[:id])
    end

end

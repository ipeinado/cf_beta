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
      if @user.save
          log_in @user unless logged_in?
          flash[:success] = "Bienvenido a Closefunding!"
          redirect_to @user
      else
          render 'new'
      end
  end

  def edit
  end

  def update
      if @user.update_attributes(user_params)
          flash[:success] = "Tu perfil se ha actualizado"
          redirect_to @user
      else
          render 'edit'
      end
  end

  def destroy
      @user.destroy
      flash[:success] = "#{@user.name} ha sido eliminado"
      redirect_to users_path
  end

  private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end

    def get_user
        @user = User.find(params[:id])
    end

    # Before filters
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Por favor, entra antes de visitar esta página"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:danger] = "Operación no permitida"
        redirect_to root_url
      end
    end

    def admin_user
        redirect_to root_url unless current_user.admin?
    end

end

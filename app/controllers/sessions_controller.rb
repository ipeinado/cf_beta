class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
          flash[:success] = "Bienvenido de nuevo a Closefunding"
          log_in user
          redirect_back_or user
      else
          flash.now[:danger] = "La combinación correo / contraseña no es correcta"
          render 'new'
      end
  end

  def destroy
      log_out
      redirect_to root_url
  end
end

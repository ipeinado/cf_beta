class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
          flash[:success] = I18n.t(:login_success, name: user.name)
          log_in user
          redirect_back_or user
      else
          flash.now[:danger] = I18n.t(:login_fail)
          render 'new'
      end
  end

  def destroy
      log_out
      redirect_to root_url
  end
end

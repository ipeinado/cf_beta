module SessionsHelper
    # Logs in the current user
    def log_in(user)
        session[:user_id] = user.id
    end

    # Gets the current user and stores it in an instance variable
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    # Checks if the user is currently logged in
    def logged_in?
        !current_user.nil?
    end

    # Logs out the current user
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    # Checks if user is the current user
    def current_user?(user)
        user == current_user
    end

    # Redirects to stored location (or to the default)
    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end

    # Stores location trying to be accessed
    def store_location
        session[:forwarding_url] = request.url if request.get?
    end

     # Before filters
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = I18n.t(:user_not_logged_in)
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

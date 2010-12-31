module Authentication

  def current_user(user=nil)
    if user
      raise "#{user.class} is not a User model" unless user.is_a?(User)
      session[:current_user] = user.try(:id)
      @current_user = user
    else
      @current_user || User.find_by_id(session[:current_user])
    end
  end

  def clear_current_user
    session[:current_user] = nil
  end

  def require_login
    except = require_login_except rescue []

    unless current_user || except.include?(params[:action])
      flash[:error] = "You must login to view that page."
      redirect_to "/admin/login"
    end
  end

end

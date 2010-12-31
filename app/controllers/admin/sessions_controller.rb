class Admin::SessionsController < ApplicationController
  before_filter :require_login

  def new
    if current_user
      redirect_to "/admin"
    end
  end

  def create
    if current_user(User.authenticate(params))
      flash[:notice] = "Logged in successfully"
      redirect_to "/admin"
    else
      flash[:error] = "Incorrect username or password"
      redirect_to "/admin/login"
    end
  end

  def logout
    flash[:notice] = "You have been logged out" if current_user
    clear_current_user
    redirect_to "/"
  end
  
  def password
  end
  
  def change_password
    if (@user = current_user).change_password!(params[:password], params[:password_confirm])
      flash[:notice] = "Your password has been changed"
    else
      flash[:error] = @user.errors.full_messages.to_sentence
    end
    
    redirect_to password_admin_sessions_path
  end

  protected
  
  def require_login_except
    ["new", "create", "logout"]
  end
end

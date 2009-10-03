# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time
  helper_method :current_user_session, :current_user, :admin?
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  filter_parameter_logging :password, :password_confirmation

  protect_from_forgery # See ActionController::RequestForgeryProtection for details


  private

  def require_not_logged_in
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page."
      redirect_to root_path
      return false
    end
  end

  def require_logged_in
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page."
      redirect_to login_path
      return false
    end
  end

  def require_admin
    unless admin?
      store_location
      flash[:notice] = "You must be logged in as ADMIN to access this page."
      redirect_to root_path
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def admin?
    current_user == nil ? false : current_user.is_admin?
  end
end

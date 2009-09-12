# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  helper :all # include all helpers, all the time
  helper_method :current_user, :admin?

  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  private

  def authorize_logged_in
    if current_user
      flash[:notice] = "Already logged in."
      redirect_to root_path
    end
  end

  def authorize_not_logged_in
    if !current_user
      flash[:notice] = "Not logged in."
      redirect_to root_path
    end
  end

  def authorize_admin
    unless admin?
      flash[:notice] = "Unauthorized access."
      redirect_to root_path
    end
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

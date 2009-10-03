class UsersController < ApplicationController

  before_filter :require_not_logged_in, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
end

class UsersController < ApplicationController

  before_filter :authorize_not_logged_in, :except => [:new, :create]
  before_filter :authorize_logged_in, :except => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration successful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully update profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end

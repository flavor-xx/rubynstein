class Admin::UsersController < Admin::AdminController

  def index
    @users = User.search(params[:search], params[:page], 8) 
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated #{@user.login}."
      redirect_to admin_users_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.update_attribute(:status_id, 4)
    flash[:notice] = "Successfully deleted #{@user.login}."
    redirect_to admin_users_path
  end
end
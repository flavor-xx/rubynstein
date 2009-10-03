class Lounge::UserController < Lounge::LoungeController
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to lounge_lounge_index_path
    else
      render :action => 'edit'
    end
  end
end
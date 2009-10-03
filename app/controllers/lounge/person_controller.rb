class Lounge::PersonController < Lounge::LoungeController
  
  def set_to_current_user()
    @person = Person.find(params[:id])
    if @person
      current_user.person = @person
      if current_user.save
        flash[:notice] = "Successfully set #{@person.name} for #{current_user.login}."
      end
    end
    redirect_to edit_lounge_person_path
  end
  
  def edit
    redirect_to new_lounge_person_path and return if current_user.person.nil?
    @person = current_user.person
    @people = Person.search(params[:search], params[:page], 4)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def new
    @person = Person.new
    @people = Person.search(params[:search], params[:page], 4)
  end 
  
  def create
    @person = Person.new(params[:person])
    @person.birthday = Time.now
    if @person.save
      current_user.person = @person
      if current_user.save
        flash[:notice] = "Successfully created #{@person.name}for #{current_user.login}."
        redirect_to lounge_lounge_index_path
      else   
        render :action => 'edit'
      end
    else
      render :action => 'edit'
    end
  end
  
  def update
    @person = current_user.person
    if @person.update_attributes(params[:person])
      flash[:notice] = "Successfully updated #{@person.name}."
      redirect_to lounge_lounge_index_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @person = current_user.person
    @person.update_attribute(:status_id, 4)
    flash[:notice] = "Successfully deleted #{@person.name}."
    redirect_to lounge_lounge_index_path
  end
end
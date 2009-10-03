class Admin::PeopleController < Admin::AdminController

  def index
    @people = Person.search(params[:search], params[:page], 4)
    respond_to do |format|
          format.html 
          format.js
    end
  end
  
  def new
    @person = Person.new
  end
  
  def create
    @person = Person.new(params[:person])
    @person.birthday = Time.now
    if @person.save
      flash[:notice] = "Successfully created #{@person.name}."
      redirect_to admin_people_path
    else
      render :action => 'new'
    end
  end

  def edit
    @person = Person.find(params[:id])
  end
  
  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params[:person])
      flash[:notice] = "Successfully updated #{@person.name}."
      redirect_to admin_people_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @person = Person.find(params[:id])
    @person.update_attribute(:status_id, 4)
    flash[:notice] = "Successfully deleted #{@person.name}."
    redirect_to admin_people_path
  end
end
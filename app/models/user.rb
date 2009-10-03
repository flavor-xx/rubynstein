class User < ActiveRecord::Base
  default_scope :conditions => "status_id != #{DELETED}"

  acts_as_authentic

  belongs_to :status_group
  belongs_to :status
  belongs_to :person

  validates_presence_of :person_id, :message => "A user needs one person"
  
  attr_protected :is_admin

  def self.search(search, page, per_page = 10)
    paginate :per_page => per_page,
             :page => page,
             :conditions => ['login like ?', "%#{search}%"],
             :order => 'login'
  end

  def before_validation_on_create
    if self.person_id.nil?
      @person = Person.find(1)
      if @person
        self.person_id = @person.id
      end
    end
    super
    p "before_validation_on_create_user"
  end

end

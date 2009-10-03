class Person < ActiveRecord::Base
  default_scope :conditions => "status_id != #{DELETED}"

  belongs_to :status_group
  belongs_to :status
  has_one :user
  
  def self.search(search, page, per_page = 10)
    paginate :per_page => per_page,
             :page => page,
             :conditions => ['name like ?', "%#{search}%"],
             :order => 'name'
  end
  
end

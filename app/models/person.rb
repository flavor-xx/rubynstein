class Person < ActiveRecord::Base
  default_scope :conditions => "status_id != #{DELETED}"

  belongs_to :status_group
  belongs_to :status
  has_one :user
end

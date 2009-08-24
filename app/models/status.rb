class Status < ActiveRecord::Base

  has_many :status_group_statuses
  has_many :status_groups, :through => :status_group_statuses

  validates_presence_of :name

end

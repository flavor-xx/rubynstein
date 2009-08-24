class StatusGroupStatus < ActiveRecord::Base

  belongs_to :status_group
  belongs_to :status

  validates_presence_of :status_group, :status

end

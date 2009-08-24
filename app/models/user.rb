class User < ActiveRecord::Base

  belongs_to :status_group
  belongs_to :status

end

class StatusGroup < ActiveRecord::Base

  #has_many :children, :class_name => :status_group, :foreign_key  => :parent_id
  #belongs_to :parent, :class_name => :status_group, :foreign_key  => :parent_id
  #acts_as_tree :order => :name

  has_many :status_group_statuses
  has_many :statuses, :through => :status_group_statuses


  validates_presence_of :name

end

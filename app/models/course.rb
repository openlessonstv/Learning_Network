class Course < ActiveRecord::Base
  has_many :lessons, :order => :id, :dependent => :destroy

  default_scope :order => :id
end

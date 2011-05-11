class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :name, :email
  has_many :videos

  validates :name, :presence => true
end

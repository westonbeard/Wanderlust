class User < ActiveRecord::Base
  has_secure_password
  has_many :trails, :through => :trail_users
  validates :email, presence: true
end

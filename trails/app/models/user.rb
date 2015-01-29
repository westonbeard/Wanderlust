class User < ActiveRecord::Base
  has_secure_password
  has_many :trail_users, dependent: :destroy
  has_many :trails, :through => :trail_users
  validates :email, presence: true, uniqueness: true

  attr_accessible :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end

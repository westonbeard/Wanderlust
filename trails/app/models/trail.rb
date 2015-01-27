class Trail < ActiveRecord::Base
  has_many :trail_users
  has_many :users, :through => :trail_users
end

class Trail < ActiveRecord::Base
  has_many :users, :through => :trail_users

end

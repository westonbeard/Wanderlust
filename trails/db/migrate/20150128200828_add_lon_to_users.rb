class AddLonToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lon, :decimal
  end
end

class RemovePhoneFromUsers < ActiveRecord::Migration
  def up
  	add_column :users, :image, :text
  end

  def down
  	remove_column :users, :phone
  end
end
class AddIndexImage < ActiveRecord::Migration
  def up
  	add_column :indices, :image, :text
  end
end

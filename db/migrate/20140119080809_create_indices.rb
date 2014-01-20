class CreateIndices < ActiveRecord::Migration
  def change
    create_table :indices do |t|
    	t.text :surl
    	t.text :web_url
    	t.string :fb_id

      	t.timestamps
    end
  end
end

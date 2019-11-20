class AddColumnposts < ActiveRecord::Migration[5.2]
  def change
  	add_column :posts,  :favorite_count, :integer
  end
end

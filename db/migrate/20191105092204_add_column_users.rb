class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :name, :string
  	add_column :users, :image_id, :string
  	add_column :users, :introduction, :text
    add_column :users, :team_id, :integer

  end
end

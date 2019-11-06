class CreateStadia < ActiveRecord::Migration[5.2]
  def change
    create_table :stadia do |t|
    	t.string :name
        t.string :image_id
        t.text :information
        t.decimal :position

      t.timestamps
    end
  end
end

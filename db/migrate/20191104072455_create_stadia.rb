class CreateStadia < ActiveRecord::Migration[5.2]
  def change
    create_table :stadia do |t|
    	t.string :stadium_name
        t.string :stadium_image_id
        t.text :information
        t.decimal :position

      t.timestamps
    end
  end
end

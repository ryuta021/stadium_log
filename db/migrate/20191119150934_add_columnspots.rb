class AddColumnspots < ActiveRecord::Migration[5.2]
  def change
	add_column :spots,  :address, :string
    add_column :spots,  :latitude, :float
    add_column :spots,  :longitude, :float
    add_column :spots,  :spots_image_id, :string
    add_column :spots,  :spot_title, :string
  end
end

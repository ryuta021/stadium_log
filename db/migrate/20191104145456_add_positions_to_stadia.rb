class AddPositionsToStadia < ActiveRecord::Migration[5.2]
  def change
  	add_column :stadia, :address, :string
  	add_column :stadia, :latitube, :float
  	add_column :stadia, :longitude, :float


  end
end

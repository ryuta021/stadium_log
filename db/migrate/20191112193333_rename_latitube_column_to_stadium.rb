class RenameLatitubeColumnToStadium < ActiveRecord::Migration[5.2]
  def change
  	rename_column :stadia, :latitube, :latitude
  end
end

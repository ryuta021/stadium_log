
class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
    	t.string :spot_number
        t.text :spot_content
        t.integer :spot_place
        t.integer :spot_time
        t.integer :plan_id
      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    	t.integer :user_id
    	t.integer :stadium_id
    	t.datetime :watching_date
    	t.string :posted_image_id
    	t.text :post_content
    	t.float :access_rate
    	t.float :gouremet_rate
    	t.float :sightseeing_rate
    	t.float :mood_rate
    	t.float :capacity_rate
        t.datetime :deleted_at
        t.float :total_rate
        t.timestamps
    end
  end
end

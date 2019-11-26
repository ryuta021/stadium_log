class AddColumnPlans < ActiveRecord::Migration[5.2]
  def change
  	add_column :plans, :title, :string
  	add_column :spots,  :spot_title, :string
  end
end

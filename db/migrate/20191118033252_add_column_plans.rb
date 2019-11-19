class AddColumnPlans < ActiveRecord::Migration[5.2]
  def change
  	add_column :plans, :title, :string
  end
end

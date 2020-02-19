class UpdateDisponibilityPlant < ActiveRecord::Migration[6.0]
  def change
    remove_column :plants, :disponibility
    add_column :plants, :disponibility_start, :date
    add_column :plants, :disponibility_end, :date
  end
end

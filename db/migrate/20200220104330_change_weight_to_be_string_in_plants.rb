class ChangeWeightToBeStringInPlants < ActiveRecord::Migration[6.0]
  def change
    change_column :plants, :weight, :string
  end
end

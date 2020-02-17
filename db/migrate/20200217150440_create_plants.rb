class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :species
      t.integer :price
      t.string :size
      t.integer :weight
      t.string :comments
      t.string :disponibility
      t.string :indoor_outdoor
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

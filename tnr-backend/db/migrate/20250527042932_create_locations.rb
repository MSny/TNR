class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.text :description

      t.timestamps
    end
  end
end

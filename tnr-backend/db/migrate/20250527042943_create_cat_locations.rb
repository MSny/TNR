class CreateCatLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :cat_locations do |t|
      t.references :cat, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.datetime :first_seen
      t.datetime :last_seen
      t.text :notes

      t.timestamps
    end
  end
end

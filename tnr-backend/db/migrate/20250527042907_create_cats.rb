class CreateCats < ActiveRecord::Migration[8.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :color
      t.text :description
      t.string :status
      t.boolean :spayed_neutered
      t.boolean :microchipped
      t.text :health_notes

      t.timestamps
    end
  end
end

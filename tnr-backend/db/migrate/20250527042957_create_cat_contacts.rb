class CreateCatContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :cat_contacts do |t|
      t.references :cat, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.string :relationship_type

      t.timestamps
    end
  end
end

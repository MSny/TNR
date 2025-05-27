class CreateHealthRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :health_records do |t|
      t.references :cat, null: false, foreign_key: true
      t.datetime :visit_date
      t.string :veterinarian
      t.text :notes
      t.text :treatment
      t.decimal :cost

      t.timestamps
    end
  end
end

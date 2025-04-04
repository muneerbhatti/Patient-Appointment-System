class CreateMedicines < ActiveRecord::Migration[7.2]
  def change
    create_table :medicines do |t|
      t.string :name
      t.integer :medicine_type, default: 0
      t.references :prescription, null: false, foreign_key: true

      t.timestamps
    end
  end
end

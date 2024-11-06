class CreateTokens < ActiveRecord::Migration[7.2]
  def change
    create_table :tokens do |t|
      t.string :Blood_pressure
      t.string :Temperature
      t.string :Weight
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end

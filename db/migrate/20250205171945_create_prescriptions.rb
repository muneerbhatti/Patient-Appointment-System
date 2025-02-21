class CreatePrescriptions < ActiveRecord::Migration[7.2]
  def change
    create_table :prescriptions do |t|
      t.string :name
      t.string :type
      t.string :formula
      
       t.references :token, null: false, foreign_key: true
    t.timestamps
    end
  end
end

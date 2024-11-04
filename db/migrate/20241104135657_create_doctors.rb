class CreateDoctors < ActiveRecord::Migration[7.2]
  def change
    create_table :doctors do |t|
      t.string :Name
      t.string :Email
      t.string :ConectNo
      t.string :Address
      t.string :Specialization
      t.string :Exprince_year

      t.timestamps
    end
  end
end

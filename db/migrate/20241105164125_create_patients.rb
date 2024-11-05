class CreatePatients < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.string :Name
      t.string :CNIC
      t.string :PhoneNo
      t.string :Gender
      t.string :date_of_birth
      t.string :Address

      t.timestamps
    end
  end
end

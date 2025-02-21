class CreateAdmins < ActiveRecord::Migration[7.2]
  def change
    create_table :admins do |t|
      t.string :Name
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end

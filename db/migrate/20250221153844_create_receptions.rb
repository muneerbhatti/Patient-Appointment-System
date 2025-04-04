class CreateReceptions < ActiveRecord::Migration[7.2]
  def change
    create_table :receptions do |t|
      t.string :Name
      t.string :phoneno
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end

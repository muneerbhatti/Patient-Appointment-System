class AddEmailToPatients < ActiveRecord::Migration[7.2]
  def change
    add_column :patients, :email, :string
  end
end

class RenameTypeColumnInPrescriptions < ActiveRecord::Migration[7.2]
  def change
    rename_column :prescriptions, :type, :category
  end
end

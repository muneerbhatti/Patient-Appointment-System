class RenameConectNoInDoctor < ActiveRecord::Migration[7.2]
  def change
    rename_column :doctors, :ConectNo, :ContactNo
  end
end

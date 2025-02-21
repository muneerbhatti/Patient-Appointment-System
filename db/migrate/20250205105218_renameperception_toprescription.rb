class RenameperceptionToprescription < ActiveRecord::Migration[7.2]
  def change
    rename_table :perceptions , :prescription
  end
end

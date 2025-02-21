class DropPrescriptionsTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :prescription
  end
end

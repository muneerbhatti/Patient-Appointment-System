class RemovePatientIdFromPayment < ActiveRecord::Migration[7.2]
  def change
    remove_column :payments, :patient_id, :integer
  end
end

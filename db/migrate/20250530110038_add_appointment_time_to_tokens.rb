class AddAppointmentTimeToTokens < ActiveRecord::Migration[7.2]
  def change
    add_column :tokens, :appointment_time, :datetime
  end
end

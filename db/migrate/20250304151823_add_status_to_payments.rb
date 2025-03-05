class AddStatusToPayments < ActiveRecord::Migration[7.2]
  def change
    add_column :payments, :status, :integer
  end
end

class AddStatusToPayments < ActiveRecord::Migration[7.2]
  def change
    add_column :payments, :status, :integer, default: 0
  end
end

class AddTokenIdToPayments < ActiveRecord::Migration[7.2]
  def change
    add_column :payments, :token_id, :integer
  end
end

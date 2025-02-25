class AssStatusAndMethodToPayments < ActiveRecord::Migration[7.2]
  def change
    
    add_column :payments, :method, :integer, default:0
  end
end

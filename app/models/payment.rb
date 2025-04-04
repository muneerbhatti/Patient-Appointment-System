class Payment < ApplicationRecord
  
  belongs_to :token
  validates  :amount, :detail, presence:true
  enum :status, [:pending, :paid, :refunded]
  enum :payment_type, [:cash, :jazz_cash, :easy_passa]
  # enum :method, { cash: 0, credit_card: 1, debit_card: 2, online: 3, insurance: 4 }

end

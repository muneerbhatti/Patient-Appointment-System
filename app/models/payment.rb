class Payment < ApplicationRecord
  belongs_to :patient
  belongs_to :token
  validates :payment_type, :amount, :detail, presence:true
  enum :payment_type, [:pending, :paid, :refunded]
  # enum :method, { cash: 0, credit_card: 1, debit_card: 2, online: 3, insurance: 4 }

end

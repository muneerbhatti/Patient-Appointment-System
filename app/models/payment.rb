class Payment < ApplicationRecord
  belongs_to :patient
  validates :payment_type, :amount, :detail, presence:true
  validates 
  enum :status,{:pending,:completed, :failed, :refunded, :canceled}
  enum :method, {:cash, :credit_card,:debit_card,:online,:insurance}
end

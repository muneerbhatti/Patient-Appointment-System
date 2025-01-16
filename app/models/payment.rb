class Payment < ApplicationRecord
  belongs_to :patient
  validates :payment_type, :amount, :detail, presence:true
end

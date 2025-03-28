class Token < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  has_one :payment, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  accepts_nested_attributes_for :prescriptions, reject_if: :all_blank, allow_destroy: true
  # enum status: { pending: 0, completed: 1, failed: 2, refunded: 3, canceled: 4 }
  enum status: [:pending, :completed, :failed, :refunded, :canceled]
before_save :set_status_based_on_payment

def set_status_based_on_payment
      if payment&.status == "completed"
         self.status = :completed
      elsif payment&.status == "failed"
         self.status = :failed
      elsif payment&.status == "refunded"
       self.status = :refunded
      else
       self.status = :pending
     end
   end


end

# has many through Association ...............
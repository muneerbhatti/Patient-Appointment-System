class Token < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  has_one :payment, dependent: :destroy
    has_one :prescription , dependent: :destroy
  # accepts_nested_attributes_for :prescriptions, reject_if: :all_blank, allow_destroy: true
  # enum status: { pending: 0, completed: 1, failed: 2, refunded: 3, canceled: 4 }
  enum status: [:pending, :completed,  :canceled]
before_create :set_pending_status

after_create :check_prescription_status


private 

def set_pending_status
  self.status= 'pending'
  end

  def check_prescription_status 
    if prescriptions.presend?
      updated(status: 'completed' ) 
      else
       updated(status: 'canceled') 
    end
 end



end

# has many through Association ...............
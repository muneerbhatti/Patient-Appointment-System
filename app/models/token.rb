class Token < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  has_many :prescriptions, dependent: :destroy
  accepts_nested_attributes_for :prescriptions, reject_if: :all_blank, allow_destroy: true

end

class Token < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  has_many :prescriptions, dependent: :destroy
end

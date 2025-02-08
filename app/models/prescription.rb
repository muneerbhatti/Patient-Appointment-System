class Prescription < ApplicationRecord
	validates :name,  presence:true
	belongs_to :doctor
	belongs_to :patient
end

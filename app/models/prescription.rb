class Prescription < ApplicationRecord
	validates :name,  presence:true
	belongs_to :token
	has_many :medicines
	accepts_nested_attributes_for :medicines

end

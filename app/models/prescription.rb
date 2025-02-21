class Prescription < ApplicationRecord
	validates :name,  presence:true
	belongs_to :token
	
end

class Doctor < ApplicationRecord
	validates :Name, :Specialization, presence:true
	validates :ConectNo , presence:true, uniqueness:true
end

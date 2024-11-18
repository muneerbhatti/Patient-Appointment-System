class Doctor < ApplicationRecord
	validates :Name, :Specialization, presence:true
	validates :ConectNo , presence:true, uniqueness:true
	has_many :users, as: :userable, dependent: :destroy
end

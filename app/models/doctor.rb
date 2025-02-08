class Doctor < ApplicationRecord
	validates :Name, :Specialization, presence:true
	validates :ConectNo , presence:true, uniqueness:true
	# has_many :users, as: :userable, dependent: :destroy
	has_one :user, as: :userable, dependent: :destroy
	has_many :prescriptions, dependent: :destroy
end

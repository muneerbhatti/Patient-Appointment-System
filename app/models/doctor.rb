class Doctor < ApplicationRecord
	# validates :Name, :Specialization, presence:true
	# validates :ContactNo , presence:true, uniqueness:true
	# validates :Email, presence:true, uniqueness:true
	# has_many :users, as: :userable, dependent: :destroy
	has_one :user, as: :userable, dependent: :destroy
	has_many :tokens
    has_many :doctors, through: :tokens
    
	after_create :set_devise_user


	def set_devise_user
		
	self.create_user(email: self.Email, password:"123456")
	end


	
end

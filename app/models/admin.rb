class Admin < ApplicationRecord
	validates :email, presence:true , uniqueness:true
	has_one :user, as: :userable, dependent: :destroy

	after_create :set_devise_user
	def set_devise_user
		self.create_user(email:self.email,password:"123456")
	end
end
	
class Patient < ApplicationRecord
	validates :Name, presence:true
	validates :CNIC, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true 

	has_one :user, as: :userable, dependent: :destroy
     has_many :tokens, dependent: :destroy
     has_many :payments, through: :tokens

    after_create :set_devise_user
	def set_devise_user
		self.create_user(email: self.email, password:"123456")
	end

	
end

# class Physician < ApplicationRecord
#   has_many :appointments
#   has_many :patients, through: :appointments
# end

# class Appointment < ApplicationRecord
#   belongs_to :physician
#   belongs_to :patient
# end

# class Patient < ApplicationRecord
#   has_many :appointments
#   has_many :physicians, through: :appointments
# end

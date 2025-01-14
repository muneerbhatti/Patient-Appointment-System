class Patient < ApplicationRecord
	validates :Name, presence:true
	validates :CNIC, presence:true, uniqueness:true

	has_many :users, as: :userable, dependent: :destroy
end

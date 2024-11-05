class Patient < ApplicationRecord
	validates :Name, presence:true
	validates :CNIC, presence:true, uniqueness:true  
end

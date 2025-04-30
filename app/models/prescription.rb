class Prescription < ApplicationRecord
	validates :name,  presence:true
	belongs_to :token
	has_many :medicines
	accepts_nested_attributes_for :medicines


	after_create :mark_token_as_completed

	private


def mark_token_as_completed
  token.update(status: 'completed')  # ✅ This updates the associated token's status
end


end

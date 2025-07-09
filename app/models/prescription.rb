class Prescription < ApplicationRecord
	validates :name,  presence:true
	belongs_to :token
	has_many :medicines, inverse_of: :prescription, dependent: :destroy
  accepts_nested_attributes_for :medicines, allow_destroy: true
	


	after_create :mark_token_as_completed

	private


def mark_token_as_completed
  token.update(status: 'completed')  # ✅ This updates the associated token's status
end


end

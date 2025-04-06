class AppointmentController<ApplicationController
	layout :set_layout
   def index
   	
   	@total_doctors = Doctor.count
   	@total_patients=Patient.count
   	@total_tokens=Token.count
   	# @total_payments=Payment.sum(:amount)
   	   @total_payments = Payment.where('created_at >= ?', 1.year.ago).sum(:amount)
	end
	def set_layout
      current_user.userable_type.pluralize.downcase
  end
end
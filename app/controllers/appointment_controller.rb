class AppointmentController<ApplicationController
   def index
   	
   	@total_doctors = Doctor.count
   	@total_patients=Patient.count
   	@total_tokens=Token.count
   	# @total_payments=Payment.sum(:amount)
   	   @total_payments = Payment.where('created_at >= ?', 1.year.ago).sum(:amount)
	end
end
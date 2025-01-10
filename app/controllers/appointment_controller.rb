class AppointmentController<ApplicationController
   def index
   	@total_doctors = Doctor.count
   	@total_patients=Patient.count
   	@total_tokens=Token.count
	end
end
class PrescriptionsController<ApplicationController
	def index
		@prescriptions=Prescription.all
	end
    def new
        @doctor = Doctor.find(params[:doctor_id])
        @patient = Patient.find(params[:patient_id])
        @prescriptions= @doctor.prescriptions.build(patient_id: @patient.id)

     end


end
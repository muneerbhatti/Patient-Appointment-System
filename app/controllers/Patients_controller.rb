class PatientsController<ApplicationController
     before_action :authenticate_user!
def index
  if current_user.userable_type == "Admin" || current_user.userable_type == "Reception"
    if params[:search].present?
      @patients = Patient.where('Name LIKE ? OR id LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @patients = Patient.all
    end
  elsif current_user.userable_type == "Doctor"
    doctor_id = current_user.userable.id
    @patients = Patient.joins(:tokens).where(tokens: { doctor_id: doctor_id }).distinct
  else # Assume current_user is a patient
    current_patient_id = current_user.userable.id
    @patients = Patient.where(id: current_patient_id)
  end
end

    
    def new
    	@patient=Patient.new
    end
    def create
       
        @patient=Patient.new(Name: params[:patient][:Name],
            CNIC: params[:patient][:CNIC],
            PhoneNo: params[:patient][:PhoneNo],
            date_of_birth: params[:patient][:date_of_birth],
            Address: params[:patient][:Address],
            Gender: params[:patient][:Gender],
            email: params[:patient][:email])
        if @patient.save
            redirect_to patients_path ,notice: "Patient was successfully created!!.. "
        else

            render :new
        end
    end
    def edit
        @patient=Patient.find(params[:id])
    end
    def update
        @patient=Patient.find(params[:id])
        if @patient.update(params_patient)
            redirect_to patients_path,notice:'Patient was successfully Updated!!!...'
        else
            render :edit
        end
    end
    def show
        @patient=Patient.find(params[:id])
    end

def destroy
  @patient = Patient.find(params[:id])
  @patient.tokens.destroy_all  # Delete related appointments
  @patient.destroy
  redirect_to patients_path, notice: 'Patient deleted successfully.'
end

    private
    def params_patient
        params.require(:patient).permit(:Name, :CNIC, :PhoneNo, :Gender, :date_of_birth,:Address,:email)
    end
end
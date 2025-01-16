class PatientsController<ApplicationController
     before_action :authenticate_user!
	def index
	    @patients=Patient.all
        # Retrieve the search parameter, if any
    if params[:search].present?
      @patients = Patient.where('Name LIKE ?', "%#{params[:search]}%")
      @patients = Patient.where('id LIKE ?', "%#{params[:search]}%")
    else
      @patients = Patient.all
     end
   end
    
    
    def new
    	@patient=Patient.new
    end
    def create
        @patient=Patient.new(Name: params[:patient][:Name],CNIC: params[:patient][:CNIC],
            PhoneNo: params[:patient][:PhoneNo],date_of_birth: params[:patient][:date_of_birth],
            Address: params[:patient][:Address],Gender: params[:patient][:Gender] )
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
    private
    def params_patient
        params.require(:patient).permit(:Name, :CNIC, :PhoneNo, :Gender, :date_of_birth,:Address)
    end
end
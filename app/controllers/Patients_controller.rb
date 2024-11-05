class PatientsController<ApplicationController
	def index
	    @patients=Patient.all
    end
    def new
    	@patient=Patient.new
    end
end
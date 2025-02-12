class PrescriptionsController<ApplicationController
  def index
    @token = Token.find(params[:token_id])
    @prescriptions= Prescription.all
  end

  def new
    @token = Token.find(params[:token_id])
    @prescriptions= @token.prescriptions.build
  end

  def create
    @token = Token.find(params[:token_id])
    @prescription= @token.prescriptions.build(prescription_params)

    if @prescription.save
      redirect_to token_prescriptions_path, notice: "Prescription was successfully created."
    else
      render :new
    end
  end
  def edit
    @token=Token.find(params[:token_id])
    @prescription=Prescription.find(params[:id])
  end
  def update
    @token=Token.find(params[:token_id])
    @prescription=Prescription.find(params[:id])
     if @prescription.update(prescription_params) 
      redirect_to token_prescriptions_path , notice:'Prescription have be successfully Updated!!'
    else
      render :edit
    end
  end
  def show 
     @token=Token.find(params[:token_id])
     @prescription=Prescription.find(params[:id])
  end

  private

  def prescription_params
    params.require(:prescription).permit(:category, :name, :formula, :token_id)
  end
end

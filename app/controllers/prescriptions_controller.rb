class PrescriptionsController < ApplicationController
  def index
    @token = Token.find(params[:token_id])
    @prescriptions = Prescription.all
  end

  def new
    @token = Token.find(params[:token_id])
    @prescription = @token.build_prescription
  end

  def create
    @token = Token.find(params[:token_id])
    @prescription = @token.build_prescription(prescription_params)

    if @prescription.save
      redirect_to token_path(@token), notice: "Prescription was successfully created."
    else
      render :new
    end
  end

  def edit
    @token = Token.find(params[:token_id])
    @prescription = Prescription.find(params[:id])
  end

  def update
    @token = Token.find(params[:token_id])
    @prescription = Prescription.find(params[:id])

    if @prescription.update(prescription_params)
      redirect_to token_prescriptions_path, notice: 'Prescription has been successfully updated!'
    else
      render :edit
    end
  end

  def show 
    @token = Token.find(params[:token_id])
    @prescription = Prescription.find(params[:id])
    authorize(@prescription)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name"
      end
    end
  end

  def destroy
    @token = Token.find(params[:token_id])
    @prescription = Prescription.find(params[:id])

    if @prescription.destroy
      redirect_to token_prescriptions_path(@token), notice: 'Prescription has been successfully deleted!'
    else
      render :all
    end
  end

  private

  # def prescription_params
  #   params.require(:prescription).permit(
  #     :category,
  #     :name,
  #     :formula,
  #     :token_id,
  #     medicines_attributes: [:id, :name, :medicine_type, :_destroy]
  #   )
  def prescription_params
  params.require(:prescription).permit(:name, :category, :formula, medicines_attributes: [:id, :name, :medicine_type, :_destroy])
end


end

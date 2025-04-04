class PaymentsController<ApplicationController
	 def index
        if current_user.userable_type == "Patient"

       current_patient = current_user.userable
       @payments = current_patient.payments
    else
      @payments = Payment.all
    end
  end
	def new
		@payment=Payment.new
	end
	def create
		@payment=Payment.new(amount: params[:payment][:amount],
			payment_type: params[:payment][:payment_type],
			status: params[:payment][:status],
			detail: params[:payment][:detail],
			token_id: params[:payment][:token_id])
		if @payment.save
			redirect_to tokens_path,notice:"patients has been successfully payment"
		else
			render :new
		end
	end
	def show
		@payment=Payment.find(params[:id])
	end
	def edit
		@payment=Payment.find(params[:id])
	end
	def update
		@payment=Payment.find(params[:id])
		if @payment.update(parmas_payment)
			redirect_to payments_path
		else
			render :edit
		end
	end

private
def parmas_payment
	params.require(:payment).permit(:amount,:payment_type,:detail,:token_id, :status)
end
end



class PaymentsController<ApplicationController
	def index
		@payments=Payment.all
	end
	def new
		@payment=Payment.new
	end
	def create
		@payment=Payment.new(amount: params[:payment][:amount],payment_type: params[:payment][:payment_type],detail: params[:payment][:detail],
			patient_id: params[:payment][:patient_id])
		if @payment.save
			redirect_to payments_path
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
	params.require(:payment).permit(:amount,:payment_type,:detail,:patient_id)
end
end
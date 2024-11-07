class TokensController<ApplicationController
	def index
		@tokens=Token.all
	end
	def new
		@token=Token.new
	end
	def create
		@token=Token.new(Blood_pressure: params[:token][:Blood_pressure],Temperature: params[:token][:Temperature],
			Weight: params[:token][:Weight],doctor_id: params[:token][:doctor_id],patient_id: params[:token][:patient_id])
		if @token.save
			redirect_to tokens_path,notice:'Create was successfully created!!......'
		else
			render :new
		end
	end
	def show 
		@token=Token.find(params[:id])
	end
	def edit
		@token=Token.find(params[:id])
	end
	def update
		@token=Token.find(params[:id])
		if @token.update(params_token)
			redirect_to tokens_path,notice:'Token was successfully Updated!!...  '
		else
			render :edit
		end
	end
	private
	def params_token
		params.require(:token).permit(:Blood_pressure, :Temperature, :Weight, :doctor_id, :patient_id)
	end
end

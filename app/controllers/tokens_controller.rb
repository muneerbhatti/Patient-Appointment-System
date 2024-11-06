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
end

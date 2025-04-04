class TokensController<ApplicationController
def index
  if current_user.userable_type == "Doctor"
    current_doctor = current_user.userable  
    @tokens = current_doctor.tokens         

  elsif current_user.userable_type == "Patient"
    current_patient = current_user.userable  
    @tokens = current_patient.tokens         

  elsif current_user.userable_type == "Reception" ||current_user.userable_type=="Admin"
    @tokens = Token.all  

  else
    @tokens = []  
  end  
end
end

	def new
		@token=Token.new
	end

	def create
		@token=Token.new(Blood_pressure: params[:token][:Blood_pressure],
			Temperature: params[:token][:Temperature],
			Weight: params[:token][:Weight],
			doctor_id: params[:token][:doctor_id],
			patient_id: params[:token][:patient_id],
			status: params[:token][:status] )
		
		if @token.save
			redirect_to tokens_path,notice:'Create was successfully created!!......'
		else
			render :new
		end
	end
	def show 
		@token=Token.find(params[:id])
		authorize(@token)

		respond_to do |format|
	      format.html
	      format.pdf do
	        render pdf: "file_name"   
	      end
	    end
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
	def print
		@token=Token.find(params[:id])
	end
	def destroy
			def update
		@token=Token.find(params[:id])
		if @token.destroy(params_token)
			redirect_to tokens_path,notice:'Token was successfully Updated!!...  '
		else
			render :all
		end
	end
	private
	def params_token
		params.require(:token).permit(:Blood_pressure, :Temperature, :Weight, :doctor_id, :patient_id, :status)
	end
end

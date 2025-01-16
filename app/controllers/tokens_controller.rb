class TokensController<ApplicationController
	def index
		@tokens=Token.all
		if params[:search].present?
			@tokens=Token.where("id LIKE?", "%#{params[:search]}%")
			@tokens=Token.where("name LIKE?","#{params[:search]}%")
		else
			@tokens=Token.all
		end
	end
	def new
		@token=Token.new
	end
	def create
		@token=Token.new(Blood_pressure: params[:token][:Blood_pressure],Temperature: params[:token][:Temperature],
			Weight: params[:token][:Weight],doctor_id: params[:token][:doctor_id],patient_id: params[:token][:patient_id],payment: params[:token][:payment])
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
	        render pdf: "file_name"   # Excluding ".pdf" extension.
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
	private
	def params_token
		params.require(:token).permit(:Blood_pressure, :Temperature, :Weight, :doctor_id, :patient_id, :payment)
	end
end

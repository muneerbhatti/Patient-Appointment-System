class ReceptionsController<ApplicationController
	def index
		@receptions=Reception.all
	end
	def new
		@reception=Reception.new
	end
	def create
		@reception=Reception.new(Name: params[:reception][:Name],
			email: params[:reception][:email],
			phoneno: params[:reception][:phoneno],
			address: params[:reception][:address])
		if @reception.save
			redirect_to receptions_path, notice:'Reception has been successfully created!'
		else
			render :new
		end
	end
	def edit
		@reception=Reception.find(params[:id])
	end
	def update
		@reception=Reception.find(params[:id])
		if @reception.update(params_reception)
			redirect_to receptions_path,	notice:'Reception has been successfully Updated!'
		else 
			render :edit
		end
	end
	def show
		@reception=Reception.find(params[:id])
	end
	private
	def params_reception
		params.require(:reception).permit(:Name,:email,:phoneno, :address)
	end

end
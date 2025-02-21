class AdminsController<ApplicationController
	def index
	   @admins=Admin.all
	end
	def new
		@admin=Admin.new
	end
	def create
		@admin=Admin.new(Name: params[:admin][:Name],email: params[:admin][:email],
			address: params[:admin][:address])
		if @admin.save
			@doctor.build_user(email:params[:doctor][:Email],password:'123456').save
			redirect_to admins_path, notice:'create admin successfully!! '
		else
			render :new
		end
	end
end
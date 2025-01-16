class DoctorsController<ApplicationController
	before_action :set_doctor, only: [:show, :update, :edit, :update, :delete, :destroy ]
	def index
		@doctors = Doctor.all
		if params[:search].present?
			@doctors=Doctor.where('name LIKE?',"%#{params[:search]}%")
			@doctors=Doctor.where('id LIKE?',"%#{params[:search]}%")
		else
			@doctor=Doctor.all
		end
	end
	def new
		@doctor = Doctor.new
	end
	def create
		@doctor=Doctor.new(Name: params[:doctor][:Name],Email: params[:doctor][:Email],ConectNo: params[:doctor][:ConectNo],Specialization: params[:doctor][:Specialization],
		 Exprince_year: params[:doctor][:Exprince_year],Address: params[:doctor][:Address])
		if @doctor.save
			redirect_to doctors_path, notice: 'Doctor was successfully created.'
		else
			render :new
		end
	end
	def edit
		
	end
	def update
		
		if @doctor=Doctor.update(doctor_params)
			redirect_to doctors_path, notice: 'Doctor was successfully created.'
		else
			render :edit
		end
	end
	def show
		
	end
	def delete
		
	end
	def destroy
        
        if @doctor.destroy 
        	redirect_to doctors_path,notice: 'Doctor was successfully deleted.'
        end
	end
	def perception
		@doctor=Doctor.find(params[:id])
		redirect_to doctors_path
	end
	private
	def set_doctor
		@doctor=Doctor.find(params[:id])
	end
	def doctor_params
		params.require(:doctor).permit(:Name,:Email,:ConectNo,:Specialization,:Exprince_year,:Address)
	end
end
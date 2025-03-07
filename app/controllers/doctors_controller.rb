class DoctorsController < ApplicationController
  layout :set_layout


  before_action :set_doctor, only: [:show, :update, :edit, :destroy]


  def index
    if current_user.userable_type == "Admin"  
      @doctors = Doctor.all
      if params[:search].present?
      @doctors = Doctor.where('Name LIKE ?', "%#{params[:search]}%")
      @doctors = Doctor.where('id LIKE ?', "%#{params[:search]}%")
    else
        @doctors=Doctor.all
     end
    else
      @doctor_id = current_user.userable.id
      @doctors = Doctor.where(id: @doctor_id)
    end
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(Name: params[:doctor][:Name], 
      Email: params[:doctor][:Email],
      ContactNo: params[:doctor][:ContactNo],
      Address:  params[:doctor][:Address],
      specialization: params[:doctor][:specialization],
      experience_year: params[:doctor][:experience_year],
      )
    if @doctor.save
      @doctor.build_user(email: @doctor.email, password: '123456').save

      redirect_to doctors_path, notice: '✅ Doctor was successfully created.'
    else
      flash.now[:alert] = '⚠️ Error creating doctor. Please check the details.'
      render :new
    end
  end

  def edit
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctors_path, notice: '✅ Doctor was successfully updated.'
    else
      flash.now[:alert] = '⚠️ Error updating doctor.'
      render :edit
    end
  end

  def show
  end

  def destroy
    if @doctor.destroy
      redirect_to doctors_path, notice: '✅ Doctor was successfully deleted.'
    else
      redirect_to doctors_path, alert: '⚠️ Failed to delete the doctor.'
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :email, :connect_no, :specialization, :experience_year, :address)
  end
end
class DoctorsController < ApplicationController
  layout 'doctors'
  before_action :set_doctor, only: [:show, :update, :edit, :destroy]

  def index
    if current_user.userable_type == "Admin"
      @doctors = Doctor.all
      if params[:search].present?
        @doctors = @doctors.where("name LIKE ? OR CAST(id AS TEXT) LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
      end
    elsif current_user.userable_type == "Reception"
            @doctors = Doctor.all
      if params[:search].present?
        @doctors = @doctors.where("name LIKE ? OR CAST(id AS TEXT) LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
      end
    else
      @doctor_id = current_user.userable.id
      @doctors = Doctor.where(id: @doctor_id)
    end
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      @doctor.build_user(email: @doctor.email, password: '123456').save
      redirect_to doctors_path, notice: '✅ Doctor was successfully created.'
    else
      flash.now[:alert] = '⚠️ Error creating doctor. Please check the details.'
      render :new
    end
  end

  def edit
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctors_path, notice: '✅ Doctor was successfully updated.'
    else
      flash.now[:alert] = '⚠️ Error updating doctor.'
      render :edit
    end
  end

  def show
  end

  def destroy
    if @doctor.destroy
      redirect_to doctors_path, notice: '✅ Doctor was successfully deleted.'
    else
      redirect_to doctors_path, alert: '⚠️ Failed to delete the doctor.'
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :email, :connect_no, :specialization, :experience_year, :address)
  end

  def set_layout
      current_user.userable_type.pluralize.downcase
  end
end

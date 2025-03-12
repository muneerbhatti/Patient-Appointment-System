
class DoctorsController < ApplicationController
  layout 'doctors'
  before_action :set_doctor, only: [:show, :update, :edit]
def index
  if current_user.userable_type == "Admin" || current_user.userable_type == "Reception"
    # Admin and Reception: show all doctors and allow search
    @doctors = Doctor.all
    if params[:search].present?
      @doctors = @doctors.where("name LIKE ? OR CAST(id AS TEXT) LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end
  elsif current_user.userable_type == "Doctor"
    # Doctor: show only the logged-in doctor
    @doctor_id = current_user.userable.id
    @doctors = Doctor.where(id: @doctor_id)
  elsif current_user.userable_type == "Patient"
    # Patient: logic to display relevant doctors or appointments
    @doctors = Doctor.all  # Or implement logic to display doctors assigned to a patient
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
      @doctor.build_user(email: @doctor.Email, password: '123456').save
      redirect_to doctors_path, notice: '✅ Doctor was successfully created.'
    else
       
      redirect_to doctors_path, alert: '⚠️ Failed to delete the doctor.'
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
 def delete
   @doctor = Doctor.find(params[:id])
 end
  def destroy
     @doctor = Doctor.find(params[:id])
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
    params.require(:doctor).permit(:Name, :Email, :ContactNo, :Specialization, :experience_year, :Address)
  end

  def set_layout
      current_user.userable_type.pluralize.downcase
  end
end

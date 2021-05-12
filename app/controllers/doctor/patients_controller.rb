class Doctor::PatientsController < ApplicationController
  include PatientsControllerConcern

  before_action :authenticate_doctor!, raise: false

  before_action :set_patient, only: [:show]

  def index
    @patients = current_doctor.patients.order(:first_name)
  end

  def show
    patient_profile
    @new_consultation = Consultation.new
    @consultations = @patient.consultations.past.order(date: :desc)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.doctor = current_doctor
    @patient.skip_password_validation = true
    if @patient.save
      @patient.invite!
      # PatientMailer.invitation(@patient).deliver_now
      redirect_to doctor_patients_path
    else
      render "new"
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:id]) if Patient.find(params[:id]).doctor == current_doctor
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email)
  end
end



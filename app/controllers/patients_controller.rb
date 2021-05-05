class PatientsController < ApplicationController
  include PatientsControllerConcern

  before_action :authenticate_patient!

  before_action :set_patient, only: [ :dashboard, :activate ]

  def dashboard
    patient_profile
    @doctor = @patient.doctor
  end

  def activate
    if @patient.update(patient_params)
      @patient.activate!
      redirect_to dashboard_path
    else
      render "dashboard"
    end
  end

  private

  def set_patient
    @patient = current_patient
  end

  def patient_params
    params.require(:patient).permit(:phone_number, :avs_number, :city, :zip, :street)
  end
end

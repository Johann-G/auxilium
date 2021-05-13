class PagesController < ApplicationController
  # skip_before_action :authenticate_patient!, only: :home
  # skip_before_action :authenticate_doctor!, only: :home

  def home
    if doctor_signed_in?
      redirect_to doctor_patients_path
    elsif patient_signed_in?
      redirect_to dashboard_path
    else
      redirect_to new_doctor_session_path
    end
  end

  def dashboard
    current_doctor ? (redirect_to patients_path) : (redirect_to root_path)
  end
end 
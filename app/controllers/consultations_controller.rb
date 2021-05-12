class ConsultationsController < ApplicationController
  include ConsultationsControllerConcern

  before_action :authenticate_patient!, raise: false

  before_action :set_patient, only: [ :show ]
  before_action :set_consultation, only: [ :show ]


  private

  def set_patient
    @patient = current_patient
  end

  def set_consultation
    @consultation = current_patient.consultations.find(params[:id])
  end
end

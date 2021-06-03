class Doctor::ConsultationsController < ApplicationController
  include ConsultationsControllerConcern
  include GoogleApiControllerConcern

  before_action :authenticate_doctor!, raise: false

  before_action :set_patient, only: [ :create, :new  ]
  before_action :set_consultation, only: [ :show, :edit, :update ]

  def show
    @patient = @consultation.patient
    super
  end

  def new
    @consultation = Consultation.new
  end

  def edit
    @medications = Medication.all
    @chatroom = @consultation.patient.chatroom
  end

  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.doctor = current_doctor
    @consultation.patient = @patient
    if @consultation.save
      PatientMailer.consultation(@patient, @consultation).deliver_later
      send_calendar_invitation(@consultation)
      redirect_to doctor_patient_path(@patient)
    else
      render "new"
    end
  end

  def update
    if @consultation.update(consultation_params)
      redirect_to doctor_consultation_path(@consultation)
    else
      render "edit"
    end
  end

  private

  def set_consultation
    @consultation = current_doctor.consultations.find(params[:id])
  end

  def set_patient
    @patient = current_doctor.patients.find(params[:patient_id])
  end

  def consultation_params
    params.require(:consultation).permit(:date, :public_report, :private_report)
  end
end

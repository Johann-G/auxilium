class Doctor::ConsultationMedicationsController < ApplicationController
  before_action :authenticate_doctor!, raise: false

  before_action :set_consultation, only: [ :create, :new ]
  before_action :set_consultation_medication, only: [ :edit, :destroy, :update]

  def new
    @consultation_medication = ConsultationMedication.new
    @medications = Medication.all
  end

  def create
    @consultation_medication = ConsultationMedication.new(consultation_medication_params)
    @consultation_medication.consultation = @consultation
    if @consultation_medication.save
      redirect_to doctor_consultation_path(@consultation)
    else
      render 'new'
    end
  end

  def edit
    @consultation = @consultation_medication.consultation
    @medications = Medication.all
  end

  def update
    if @consultation_medication.update(consultation_medication_params)
      redirect_to doctor_consultation_path(@consultation_medication.consultation)
    else
      render "edit"
    end
  end

  def destroy
    @consultation_medication.destroy
    redirect_to doctor_consultation_path(@consultation_medication.consultation)
  end

  private

  def set_consultation_medication
    @consultation_medication = current_doctor.consultation_medications.find(params[:id])
  end

  def set_consultation
    @consultation = current_doctor.consultations.find(params[:consultation_id])
  end

  def consultation_medication_params
    params.require(:consultation_medication).permit(:medication_id, :description, :quantity)
  end
end

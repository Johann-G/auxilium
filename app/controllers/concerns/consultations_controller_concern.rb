module ConsultationsControllerConcern
  extend ActiveSupport::Concern

  def show
    @consultation_medications = @consultation.consultation_medications.includes(:medication)
    @chatroom = @patient.chatroom
    @videoroom = @patient.videoroom
  end
end
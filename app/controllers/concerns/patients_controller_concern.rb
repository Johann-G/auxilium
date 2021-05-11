module PatientsControllerConcern
  extend ActiveSupport::Concern

  def patient_profile
    # @doctor = @patient.doctor
    @past_consultations = @patient.consultations.past.order(date: :desc)
    @upcoming_consultations = @patient.consultations.upcoming.order(date: :desc)
    @next_consultation = @patient.next_consultation
    # @last_consultation = @patient.last_consultation
    # @new_consultation = Consultation.new
    @chatroom = @patient.chatroom
    @videoroom = @patient.videoroom
  end

end
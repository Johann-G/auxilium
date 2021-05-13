module PatientsControllerConcern
  extend ActiveSupport::Concern

  def patient_profile
    @past_consultations = @patient.consultations.past.order(date: :desc)
    @upcoming_consultations = @patient.consultations.upcoming.order(date: :desc)
    @next_consultation = @patient.next_consultation
    @chatroom = @patient.chatroom
    @videoroom = @patient.videoroom
  end

end
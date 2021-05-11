class PatientMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.patient_mailer.invitation.subject
  #
  def invitation(patient)
    @patient = patient

    mail(to: patient.email, subject: "Welcome to YouMind")
  end

  def consultation(patient, consultation)
    @patient = patient
    @consultation = consultation

    mail(to: patient.email, subject: "New consultation")
  end
end

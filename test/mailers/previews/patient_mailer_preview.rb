# Preview all emails at http://localhost:3000/rails/mailers/patient_mailer
class PatientMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/patient_mailer/invitation
  def invitation
    patient=Patient.first
    PatientMailer.invitation(patient)
  end

end

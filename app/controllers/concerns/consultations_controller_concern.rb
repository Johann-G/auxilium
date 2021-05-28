module ConsultationsControllerConcern
  extend ActiveSupport::Concern

  def show
    @consultation_medications = @consultation.consultation_medications.includes(:medication)
    @chatroom = @patient.chatroom
    @videoroom = @patient.videoroom
  end

  private

  def send_calendar_invitation(consultation)
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    event = Google::Apis::CalendarV3::Event.new({
                                                  start: Google::Apis::CalendarV3::EventDateTime.new(date: consultation.date.to_date),
                                                  end: Google::Apis::CalendarV3::EventDateTime.new(date: consultation.date.to_date),
                                                  summary: 'New consultation'
                                                })

    service.insert_event(consultation.patient.email, event)
  rescue Google::Apis::AuthorizationError
    response = client.refresh!

    session[:authorization] = session[:authorization].merge(response)

    retry
  end

  def client_options
    {
      client_id: ENV["GOOGLE_CLIENT_ID"],
      client_secret: ENV["GOOGLE_CLIENT_SECRET"],
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: callback_url
    }
  end
end
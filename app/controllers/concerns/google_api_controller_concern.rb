module GoogleApiControllerConcern
  extend ActiveSupport::Concern

  private

  def redirect_to_google
    client = Signet::OAuth2::Client.new(client_options)

    redirect_to client.authorization_uri.to_s
  end

  def send_calendar_invitation(consultation)
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    event = Google::Apis::CalendarV3::Event.new({
                                                  'start': Google::Apis::CalendarV3::EventDateTime.new(date: consultation.date.to_date),
                                                  'end': Google::Apis::CalendarV3::EventDateTime.new(date: consultation.date.to_date),
                                                  'summary': 'New consultation',
                                                  'attendees': [
                                                    {'email': consultation.patient.email}
                                                  ]
                                                })

    service.insert_event("primary", event)
  rescue Google::Apis::AuthorizationError
    response = client.refresh!

    session[:authorization] = session[:authorization].merge(response)

    retry
  end

  def client_options
    Rails.env.development? ? client_id = ENV["GOOGLE_CLIENT_ID"] : client_id = ENV["GOOGLE_CLIENT_ID_PROD"]
    Rails.env.development? ? client_secret = ENV["GOOGLE_CLIENT_SECRET"] : client_id = ENV["GOOGLE_CLIENT_SECRET_PROD"]
    puts "Development environment = #{Rails.env.development?}"
    puts "Production environment = #{Rails.env.production?}"

    {
      client_id: client_id,
      client_secret: client_secret,
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: callback_url
    }
  end
end
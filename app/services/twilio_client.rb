class TwilioClient
  attr_reader :client 

  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(user)
    client.api.account.messages.create(
      to: user.phone,
      from: +12057234319,
      body: `${user.name} arrived at his destination.`
      )
  end

  private

  def account_sid
    Rails.application.credentials.twilio[:account_sid]
  end

  def auth_token
    Rails.application.credentials.twilio[:auth_token]
  end

end
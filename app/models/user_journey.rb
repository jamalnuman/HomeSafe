class UserJourney < ApplicationRecord

  validates :user_id, uniqueness: {scope: :journey_id}


  belongs_to :user 
  belongs_to :journey
  belongs_to :ending_location, class_name: 'Location', optional: true


  def send_text(user)
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.api.account.messages.create(
      to: user.phone_number,
      from: +12057234319,
      body: "#{user.first_name} #{user.last_name} arrived at his destination."
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

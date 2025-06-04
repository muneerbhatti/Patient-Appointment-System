require 'twilio-ruby'

class TwilioSender
  def self.send_sms(to:, body:)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    if account_sid.nil? || auth_token.nil?
      raise "Twilio credentials are missing!"
    end

    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(
      from: '+Your_Twilio_Number', # Your Twilio phone number
      to: to,
      body: body
    )
  end
end

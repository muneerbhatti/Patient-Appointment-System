# app/services/sms_sender.rb
class SmsSender
  def self.send_sms(to:, body:)
    account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
    auth_token  = Rails.application.credentials.dig(:twilio, :auth_token)
    from_phone  = Rails.application.credentials.dig(:twilio, :phone_number)

    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(
      from: from_phone,
      to: to,
      body: "Sent from HAMS 🏥 - #{body}"
    )
  rescue Twilio::REST::RestError => e
    Rails.logger.error "Twilio Error: #{e.message}"
  end
end

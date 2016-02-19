class ContactMessageMailer < ApplicationMailer
  def new_message(message)
    @message = message
    mail(
      to: "contact@playtoss.net",
      subject: "New Message on VaguelyAmazing.com"
    )
  end
end

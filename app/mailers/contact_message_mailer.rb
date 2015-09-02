class ContactMessageMailer < ApplicationMailer
  def new_message(message)
    @message = message
    mail(
      to: "TODO@admin.com",
      subject: "New Message on VaguelyAmazing.com"
    )
  end
end

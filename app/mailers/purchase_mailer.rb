class PurchaseMailer < ApplicationMailer
  def new_purchase(game_ids, email)
    @game_ids = game_ids
    @email = email
    mail(
      to: @email,
      subject: "New Purchase from TODO GAME APP"
    )
  end
end

require 'open-uri'

class PurchaseMailer < ApplicationMailer
  def new_purchase(game_ids, email)
    @games = Game.find(game_ids)
    @games.each do |game|
      attachments["#{game.title}"] = open("#{game.file.url}").read
    end
    @email = email
    mail(
      to: @email,
      subject: "New Purchase from VaguelyAmazing"
    )
  end
end

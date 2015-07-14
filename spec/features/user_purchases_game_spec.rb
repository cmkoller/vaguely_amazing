require "rails_helper"

feature "User purchases game", %(
  As a User
  I want to purchase a game for download
  So I can play all these awesome creations!
) do

  context "user is signed in" do
    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      sign_in_as(user)
    end

    scenario "user successfully purchases a game" do
      game = FactoryGirl.create(:game)
      visit game_path(game)
      click_link "Add to Cart"
      expect(page).to have_content "Remove from Cart"

      click_link "My Cart(1)"
      expect(page).to have_content "My Cart"
      expect(page).to have_content game.name

      click_link "Checkout"

    end
  end

end

require "rails_helper"

feature "Admin Edits Game" do

  context "user is admin" do
    before(:each) do
      admin = FactoryGirl.create(:admin)
      sign_in_as(admin)
    end
    scenario "admin can see edit button" do
      game = FactoryGirl.create(:game)
      visit game_path(game)
      expect(page).to have_content("Edit")
    end

    scenario "admin successfully edits game" do
      game = FactoryGirl.create(:game)
      visit edit_admin_game_path(game)
      expect(page).to have_content("Edit #{game.title}")
      fill_in "Title", with: "Toss"
      click_button "Update Game"
      expect(page).to have_content("You successfully edited the game!")
    end

    scenario "admin unsuccessfully edits game" do
      game = FactoryGirl.create(:game)
      visit edit_admin_game_path(game)
      fill_in "Title", with: ""
      click_button "Update Game"
      expect(page).to have_content("Title can't be blank")
    end
  end

  context "user is not admin" do
    scenario "user cannot see edit button" do
      game = FactoryGirl.create(:game)
      visit game_path(game)
      expect(page).to_not have_content("Edit")
    end

    scenario "user cannot visit edit path" do
      game = FactoryGirl.create(:game)
      visit edit_admin_game_path(game)
      expect(page).to have_content("You are not authorized to do that.")
      expect(page).to_not have_content("Edit #{game.title}")
    end
  end

end

require "rails_helper"

feature "Admin Edits Post" do
  let!(:post) { FactoryGirl.create(:post) }

  context "admin user", focus: true do
    let!(:admin) { FactoryGirl.create(:admin) }

    scenario "admin user edits post" do
      sign_in_as(admin)
      visit edit_admin_post_path(post)
      fill_in "Title", with: "Here's a new title"
      fill_in "Body", with: "New body"
      click_button "Submit"

      expect(page).to have_content("Post updated!")
      expect(page).to have_content("Here's a new title")
      expect(page).to have_content("New body")
    end
  end

  context "non-admin user" do
    let!(:user) { FactoryGirl.create(:user) }

    scenario "user cannot visit new post page" do
      sign_in_as(user)
      visit edit_admin_post_path(post)

      expect(page).to have_content("You are not authorized to do that.")
    end
  end

  context "unauthenticated user" do
    scenario "unauthenticated user cannot visit new post page" do
      visit edit_admin_post_path(post)

      expect(page).to have_content("You are not authorized to do that.")
    end
  end
end

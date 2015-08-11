require "rails_helper"

feature "Admin Creates New Post" do
  context "admin user" do
    let!(:admin) { FactoryGirl.create(:admin) }

    scenario "admin user successfully creates new post" do
      sign_in_as(admin)
      visit new_admin_post_path
      fill_in "Title", with: "How to design awesome games"
      fill_in "Body", with: "Here's how to do it"
      click_button "Submit"

      expect(page).to have_content("Post created!")
      expect(page).to have_content("How to design awesome games")
      expect(page).to have_content("by #{admin.email}")
      expect(page).to have_content("Here's how to do it")
    end
  end

  context "non-admin user" do
    let!(:user) { FactoryGirl.create(:user) }

    scenario "user cannot visit new post page" do
      sign_in_as(user)
      visit new_admin_post_path

      expect(page).to have_content("You are not authorized to do that.")
    end
  end

  context "unauthenticated user" do
    scenario "unauthenticated user cannot visit new post page" do
      visit new_admin_post_path

      expect(page).to have_content("You are not authorized to do that.")
    end
  end
end

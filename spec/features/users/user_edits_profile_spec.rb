require "rails_helper"

feature "User Edits Profile" do
  let(:user) { FactoryGirl.create(:user) }

  scenario "user successfully edits first and last name", focus: true do
    sign_in_as(user)
    visit edit_user_registration_path(user)

    fill_in "Username", with: "Asami"
    fill_in :user_current_password, with: "password"
    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully"
  end
end

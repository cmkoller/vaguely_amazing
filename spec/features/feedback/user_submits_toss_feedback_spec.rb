require "rails_helper"

feature "User Submits Toss Feedback" do
  scenario "User successfully submits feedback" do
    visit toss_path

    fill_in "Name", with: "Christina"
    fill_in "Email", with: "christina@christinamail.com"
    fill_in "Feedback", with: "This game is great!"
    click_button "Submit"

    expect(page).to have_content "Your feedback has been recorded!"
  end
end

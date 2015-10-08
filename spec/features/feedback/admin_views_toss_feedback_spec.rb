require "rails_helper"

feature "Admin Views Toss Feedback" do
  scenario "admin views all Toss feedback" do
    FactoryGirl.create(:feedback)
    admin = FactoryGirl.create(:admin)
    sign_in_as(admin)

    visit admin_path
    click_link "Toss Feedback"

    expect(page).to have_content "Toss Feedback"
  end
end

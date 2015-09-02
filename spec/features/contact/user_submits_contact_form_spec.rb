require "rails_helper"

feature "User Submits Contact Form" do
  scenario "user successfully fills out contact form" do
    visit contact_path
    fill_in "Email", with: "user@usermail.com"
    fill_in "Message", with: "Wow! Cool games!"
    click_button "Get in touch!"

    expect(page).to have_content("Thank you! Your message has been delivered!")
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email.subject).to eq('New Message on VaguelyAmazing.com')
    expect(last_email.to).to include("TODO@admin.com")
  end
end

require "rails_helper"

feature "User Views All Posts" do
  scenario "unauthenticated user views a single posts" do
    post = FactoryGirl.create(:post)
    visit posts_path
    click_link post.title
    expect(page).to have_content(post.title)
    expect(page).to have_content("by #{post.author.email}")
    expect(page).to have_content(post.body)
  end
end

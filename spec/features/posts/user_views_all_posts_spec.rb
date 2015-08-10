require "rails_helper"

feature "User Views All Posts" do
  scenario "unauthenticated user views all posts" do
    post = FactoryGirl.create(:post)
    visit posts_path
    expect(page).to have_content(post.title)
  end
end

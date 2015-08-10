require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'

    factory :admin do
      role "admin"
    end
  end

  factory :game do
    title "Spooky Haus"
    price 19.99
  end

  factory :post do
    title "How to Design Good Games"
    body "Here is a nice long blog post on how to design good games."
    association :author, factory: :user
  end

end

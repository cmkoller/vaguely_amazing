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

end

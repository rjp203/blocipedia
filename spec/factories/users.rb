FactoryGirl.define do
  pw = RandomData.random_sentence
  factory :user do
    firstname RandomData.random_word
    lastname RandomData.random_word
    sequence(:email){|n| "user#{n}@factory.com" }
    password pw
    password_confirmation pw
  end
end


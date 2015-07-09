FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    mailchimp_auth_token Faker::Lorem.characters(10)
    mailchimp_data_center Faker::Lorem.characters(3)
  end
end

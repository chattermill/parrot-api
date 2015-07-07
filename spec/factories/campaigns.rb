FactoryGirl.define do
  factory :campaign do
    company_name Faker::Company.name
    from_name Faker::Name.name
    background_color "fff"
    foreground_color "000"
    reply_address Faker::Internet.email
    image_url Faker::Company.logo
    from_address Faker::Internet.email
  end
end

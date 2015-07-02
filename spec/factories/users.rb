FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    token "u__uJmT-D5jfBJNXIxx4ww"
  end
end

FactoryGirl.define do
  factory :survey_response do
    score 1
    body "MyText"
    survey
  end
end

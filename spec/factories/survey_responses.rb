FactoryGirl.define do
  factory :detractor_response, class: SurveyResponse do
    score (0...6).to_a.shuffle.sample
    body Faker::Lorem.words(4)
    to_create {|instance| instance.save(validate: false) }
  end

  factory :promoter_response, class: SurveyResponse do
    score [9,10].shuffle.sample
    body Faker::Lorem.words(4)
    to_create {|instance| instance.save(validate: false) }
  end

  factory :passive_response, class: SurveyResponse do
    score [7,8].shuffle.sample
    body Faker::Lorem.words(4)
    to_create {|instance| instance.save(validate: false) }
  end
end

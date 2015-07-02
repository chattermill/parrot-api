FactoryGirl.define do
  factory :access_token do
    access_token "token"
    expires_at "2015-07-01 21:48:15"
    user
  end

end

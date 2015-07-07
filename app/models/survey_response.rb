class SurveyResponse < ActiveRecord::Base
  belongs_to :survey

  def self.create_from_token params_hash
    survey = Survey.find_by(token: params_hash[:token])
    SurveyResponse.create(body: params_hash[:body],
                          score: params_hash[:score],
                          survey: survey)
  end
end

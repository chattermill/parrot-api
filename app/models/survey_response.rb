class SurveyResponse < ActiveRecord::Base
  belongs_to :survey
  delegate :campaign, :subscriber, to: :survey
  validates_presence_of :score, :body, :token

  def token=(token)
    self.survey = Survey.find_by_token(token)
  end

  private
  
  def token
    survey.token if survey.present?
  end
end

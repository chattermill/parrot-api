class SurveyResponse < ActiveRecord::Base
  include AlgoliaSearch

  belongs_to :survey
  delegate :campaign, :subscriber, to: :survey
  delegate :email, to: :subscriber
  validates_presence_of :score, :body, :token

  def token=(token)
    self.survey = Survey.find_by_token(token)
  end
  
  algoliasearch per_environment: true do
    attribute :body, :score, :email

    tags do
      ["campaign_#{ campaign.id }"]
    end

  end

  private
  
  def token
    survey.token if survey.present?
  end
end

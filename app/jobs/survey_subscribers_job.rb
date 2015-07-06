class SurveySubscribersJob < ActiveJob::Base
  queue_as :default

  def perform(campaign)
    campaign.survey_subscribers
  end
end

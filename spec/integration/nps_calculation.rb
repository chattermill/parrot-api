require 'rails_helper'

RSpec.describe "NPS Calculation", type: :integration do
  it "Correctly calculates NPS for a campaign" do
    Campaign.skip_callback(:create, :after, :send_survey_emails)
    campaign = create(:campaign)
    campaign.surveys_responses = [
      create(:promoter_response),
      create(:promoter_response),
      create(:detractor_response),
      create(:detractor_response),
      create(:detractor_response),
      create(:passive_response)
    ]
    expect(campaign.nps_score).to eq 0.17
  end
end
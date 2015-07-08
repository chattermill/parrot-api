require 'rails_helper'

RSpec.describe "NPS Calculation", type: :integration do
  before do
    Campaign.skip_callback(:create, :after, :send_survey_emails)
    @campaign = create(:campaign)
    
    allow(@campaign).to receive(:survey_responses).and_return(responses)
  end

  it "Correctly calculates NPS for a campaign" do
    expect(@campaign.nps_score).to eq -0.17
  end

  it "Correctly calculates percentage of promoters for the campaign" do
    expect(@campaign.percentage_promoters).to eq 0.33
  end

  it "Correctly calculates percentage of detractors for the campaign" do
    expect(@campaign.percentage_detractors).to eq 0.5
  end

  it "Correctly calculates percentage of passives for the campaign" do
    expect(@campaign.percentage_passives).to eq 0.17
  end

  def responses
    [
      create(:promoter_response),
      create(:promoter_response),
      create(:detractor_response),
      create(:detractor_response),
      create(:detractor_response),
      create(:passive_response)
    ]
  end
end
require 'rails_helper'

RSpec.describe Campaign, type: :model do

  let(:campaign) { Campaign.new }

  context "calculating the surveys/responses numbers and rate" do
    before do
      allow(campaign).to receive(:surveys).and_return(surveys)
      allow(campaign).to receive(:survey_responses).and_return(responses) 
    end

    it '#number_of_surveys_sent' do
      expect(campaign.number_of_surveys_sent).to eq 8
    end

    it '#number_of_responses' do
      expect(campaign.number_of_responses).to eq 6
    end

    it '#response_rate' do
      expect(campaign.response_rate).to eq 0.75
    end
  end

  def responses
    [double(score: 9), double(score: 10), double(score: 5), double(score: 1), double(score: 0), double(score: 7)]
  end

  def surveys
    double(count: 8)
  end
end

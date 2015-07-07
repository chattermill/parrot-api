require 'rails_helper'

RSpec.describe NpsCalculator, type: :model do
  let(:campaign) { double }
  let(:calculator) { NpsCalculator.new(campaign: campaign) }

  context "Calculating the score" do
    before do
      allow(campaign).to receive(:survey_responses).and_return(responses)
    end

    it '#percentage_promoters' do
      expect(calculator.percentage_promoters).to eq 0.33
    end

    it '#percentage_detractors' do
      expect(calculator.percentage_detractors).to eq 0.5
    end

    it '#percentage_passives' do
      expect(calculator.percentage_passives).to eq 0.17
    end

    it "#score" do
      expect(calculator.score).to eq -0.17
    end
  end

  def responses
    [double(score: 9), double(score: 10), double(score: 5), double(score: 1), double(score: 0), double(score: 7)]
  end
end

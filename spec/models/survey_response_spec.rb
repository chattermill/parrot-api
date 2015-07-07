require 'rails_helper'

RSpec.describe SurveyResponse, type: :model do
  let!(:survey) { Survey.create(token: "605a90f00ae2120ad219048aa328989e") }
  context "creating Response from survey token" do
    it ".create_from_token" do
      response_params = {body: "Decent. Will never use again.", 
                         score: 7,
                         token: "605a90f00ae2120ad219048aa328989e"}
      new_response = SurveyResponse.create_from_token(response_params)
      expect(new_response.survey).to eq(survey)
    end
  end
end

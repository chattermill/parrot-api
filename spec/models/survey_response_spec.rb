require 'rails_helper'

RSpec.describe SurveyResponse, type: :model do
  let!(:survey) do 
    Survey.new(token: "605a90f00ae2120ad219048aa328989e").tap do |surv| 
      surv.save(validate: false)
    end
  end
  
  context "creating Response from survey token" do
    it "#token=" do
      response_params = {body: "Decent. Will never use again.", 
                         score: 7,
                         token: "605a90f00ae2120ad219048aa328989e"}
      new_response = SurveyResponse.create(response_params)
      
      expect(new_response.survey).to eq(survey)
    end
  end
end

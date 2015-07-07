class Survey < ActiveRecord::Base
  belongs_to :subscriber
  belongs_to :campaign
  has_one :survey_response
end

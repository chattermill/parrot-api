class Survey < ActiveRecord::Base
  belongs_to :subscriber
  belongs_to :campaign
  has_one :survey_response

  delegate :name, :email, to: :subscriber

  validates_presence_of :token, :subscriber, :campaign
end


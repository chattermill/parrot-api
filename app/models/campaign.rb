class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :surveys
  has_many :survey_responses, through: :surveys

  after_create :send_survey_emails
  
  validates_presence_of :company_name, :from_name, :background_color, :foreground_color, :reply_address, :image_url

  delegate :mailchimp_list, to: :user
  delegate :subscribers, to: :mailchimp_list
  delegate :percentage_promoters, :percentage_detractors, :percentage_passives, to: :nps_calculator
  delegate :score, to: :nps_calculator, prefix: :nps

  def send_survey_emails
    SurveySubscribersJob.perform_later(self)
  end

  def survey_subscribers
    subscribers.each do |subscriber|
      survey = Survey.create(token: SecureRandom.hex,
                    subscriber: subscriber,
                    campaign: self)
      mailer.send_email(survey)
    end
  end

  def number_of_surveys_sent
    surveys.count
  end

  def number_of_responses
    survey_responses.count
  end

  def response_rate
    number_of_responses / number_of_surveys_sent.to_f
  end

  private

  def mailer
    @mailer ||= NpsMailer.new(campaign: self)
  end

  def nps_calculator
    @nps_calculator ||= NpsCalculator.new(campaign: self)
  end
end

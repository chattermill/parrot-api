class Campaign < ActiveRecord::Base
  belongs_to :user
  delegate :mailchimp_list, to: :user
  delegate :subscribers, to: :mailchimp_list
  after_create :send_survey_emails
  has_many :surveys

  validates_presence_of :company_name, :from_name, :background_color, :foreground_color, :reply_address, :image_url

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

  private

  def mailer
    @mailer ||= NpsMailer.new(campaign: self)
  end
end

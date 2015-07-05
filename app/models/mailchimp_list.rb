class MailchimpList < ActiveRecord::Base
  belongs_to :user
  has_many :subscribers
  after_create :generate_subscribers

  def create_subscribers
    mailchimp_subscribers.each do |subscriber_hash| 
      create_subscriber(subscriber_hash) if subscribed?(subscriber_hash) 
    end
  end

  def generate_subscribers
    CreateSubscribersJob.perform_later(self)
  end

  private

  def create_subscriber(subscriber_hash)
    subscribers.create(
      email: subscriber_hash["email_address"],
      subscription_date: subscriber_hash["timestamp_signup"],
      name: subscriber_hash["merge_fields"].values.join(' '),
    )
  end

  def mailchimp_subscribers
    MailchimpAPI.new(user: user).subscribers(mailchimp_id)
  end

  def subscribed?(subscriber_hash)
    subscriber_hash["status"] == "subscribed"
  end
end

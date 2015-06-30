class MailchimpList < ActiveRecord::Base
  belongs_to :user
  has_many :subscribers

  def create_subscribers
    mailchimp_subscribers.each { |subscriber_hash| create_subscriber(subscriber_hash) }
  end

  private

  def mailchimp_subscribers
    gibbon.lists.members({id: mailchimp_id, opts: {start: 0, limit: 100}})["data"]
  end

  def create_subscriber(subscriber_hash)
    Subscriber.create(
      email: subscriber_hash["email"],
      subscription_date: subscriber_hash["timestamp_opt"],
      mailchimp_list: self
    )
  end

  def gibbon
    Gibbon::API
  end
end

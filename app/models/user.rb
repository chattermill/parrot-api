class User < ActiveRecord::Base
  has_many :access_tokens, dependent: :destroy
  has_one :mailchimp_list

  validates :email, presence: true, uniqueness: true

  def access_token
    access_tokens.active.first
  end

  def available_mailchimp_lists
    mailchimp_api.available_lists
  end

  def mailchimp_api
    @mailchimp_api ||= MailchimpAPI.new(user: self)
  end
end

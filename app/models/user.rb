class User < ActiveRecord::Base
  has_many :access_tokens, dependent: :destroy
  has_one :mailchimp_list
  has_many :campaigns

  validates :email, presence: true, uniqueness: true

  def access_token
    access_tokens.active.first
  end

  def lists
    mailchimp_api.available_lists
  end

  def mailchimp_api
    @mailchimp_api ||= MailchimpAPI.new(user: self)
  end

  def selected
    mailchimp_list.mailchimp_id if mailchimp_list.present?
  end

  def selected=(selected_list_id)
    list = lists.find { |list| list[:id] == selected_list_id }

    unless MailchimpList.find_by_mailchimp_id(selected_list_id)
      MailchimpList.create(mailchimp_id: list[:id], name: list[:name], user: self)
    end
  end

  def lists=(lists)
    # Should be handled by resource eventually
  end
end

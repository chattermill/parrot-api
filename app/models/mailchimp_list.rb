class MailchimpList < ActiveRecord::Base
  belongs_to :user
  has_many :subscribers
end

class Campaign < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :company_name, :from_name, :background_color, :foreground_color, :reply_address, :image_url
end

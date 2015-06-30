class Subscriber < ActiveRecord::Base
  belongs_to :mailchimp_list
end

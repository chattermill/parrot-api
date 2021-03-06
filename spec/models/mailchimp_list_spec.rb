require 'rails_helper'

RSpec.describe MailchimpList, type: :model do
  context "Creating subscribers" do
    before do
      MailchimpList.skip_callback(:create, :after, :generate_subscribers)
      @list = create(:mailchimp_list)
      allow(@list).to receive(:mailchimp_subscribers).and_return([subscriber_hash])
    end

    it "#create_subscribers" do
      @list.create_subscribers

      expect(@list.subscribers.count).to eq 1
      expect(@list.subscribers.last.email).to eq "blabla@example.com"
      expect(@list.subscribers.last.subscription_date).to eq DateTime.parse("2015-05-12 11:18:25")
    end
  end
  
  def subscriber_hash
    {
      "email_address"=>"blabla@example.com",
      "timestamp_signup"=>"2015-05-12 11:18:25",
      "merge_fields"=>{"FNAME"=>"Michael", "LNAME"=>"James"},
      "status"=>"subscribed",
    }
  end
end

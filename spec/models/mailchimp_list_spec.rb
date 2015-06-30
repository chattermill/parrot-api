require 'rails_helper'

RSpec.describe MailchimpList, type: :model do
  context "Creating subscribers" do
    let(:list) { FactoryGirl.create(:mailchimp_list) }
    
    it "#create_subscribers" do
      allow(list).to receive(:mailchimp_subscribers).and_return([subscriber_hash])
      
      list.create_subscribers

      expect(list.subscribers.count).to eq 1
      expect(list.subscribers.last.email).to eq "blabla@example.com"
      expect(list.subscribers.last.subscription_date).to eq DateTime.parse("2015-05-12 11:18:25")
    end
  end
  
  def subscriber_hash
    {
      "email"=>"blabla@example.com",
      "id"=>"b7c9af1ae2",
      "euid"=>"b7c9af1ae2",
      "email_type"=>"html",
      "ip_signup"=>nil,
      "timestamp_signup"=>nil,
      "ip_opt"=>"555.555.555.555",
      "timestamp_opt"=>"2015-05-12 11:18:25",
      "member_rating"=>2,
      "info_changed"=>"2015-05-12 11:18:25",
      "web_id"=>285842517,
      "leid"=>285842517,
      "language"=>nil,
      "list_id"=>"0bebf552d9",
      "list_name"=>"Chattermill Beta List",
      "merges"=>{"EMAIL"=>"blabla@example.com", "FNAME"=>"", "LNAME"=>""},
      "status"=>"subscribed",
      "timestamp"=>"2015-05-12 11:18:25",
      "is_gmonkey"=>true,
      "lists"=>[],
      "geo"=>[],
      "clients"=>[],
      "static_segments"=>[],
      "notes"=>[]
    }
  end
end

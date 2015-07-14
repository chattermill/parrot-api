class MailchimpAPI
  def initialize(user:)
    @client = MailChimp3.new(
                oauth_access_token: user.mailchimp_auth_token,
                dc: user.mailchimp_data_center
              )
  end

  def available_lists
    client.lists.get["lists"].map do |list_hash|
      { 
        id: list_hash["id"], 
        name: list_hash["name"],
        list_length: list_hash["stats"]["member_count"]
      }
    end
  end

  def subscribers(list_id)
    client.lists[list_id].members.get(count: 5000)["members"]
  end

  private
  
  attr_reader :client
end
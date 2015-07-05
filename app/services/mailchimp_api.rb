class MailchimpAPI
 
  def initialize(user:)
    @client = MailChimp3.new(
                oauth_access_token: user.mailchimp_auth_token,
                dc: user.mailchimp_data_center
              )
  end

  def available_lists
    client.lists.get["lists"].map do |list_hash|
      { id: list_hash["id"], name: list_hash["name"]}
    end
  end

  private
  
  attr_reader :client
end
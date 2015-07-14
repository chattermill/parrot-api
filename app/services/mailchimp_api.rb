class MailchimpAPI
  BATCH_SIZE = 50
  MAX_SUBSCRIBERS = 2_500

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

  def subscribers(list:)
    subs = [list.list_length, MAX_SUBSCRIBERS].min
    batches = [subs / BATCH_SIZE, 1].max

    (0..batches).each_with_object([]) do |batch, memo|
      memo.concat(member_batch(list, batch))
    end
  end

  private
  
  attr_reader :client

  def member_batch(list, batch)
    client.lists[list.mailchimp_id].members.get(count: 50, offset: batch * BATCH_SIZE)["members"]
  end
end
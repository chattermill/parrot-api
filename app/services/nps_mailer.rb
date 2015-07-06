class NpsMailer
  NPS_TEMPLATE_ID = "tem_EyyDa2PuhbdiGZiwKLHCWS" #From sendwithus

  def initialize(campaign:)
    @client = SendWithUs::Api.new
    @campaign = campaign
  end

  def survey_subscribers
    campaign.subscribers.each do |subscriber|
      send_email(subscriber)
    end
  end

  private

  attr_reader :client, :campaign

  def send_email(subscriber)
    client.send_email(
      NPS_TEMPLATE_ID,
      { name: subscriber.name, address: subscriber.email },
      data: {
        first_name: subscriber.name,
        company_name: campaign.company_name,
        company_url: campaign.company_url,
        background_color: campaign.background_color, 
        foreground_color: campaign.foreground_color,
        image_url: campaign.image_url
      },
      from: {
        name: campaign.from_name,
        address: campaign.from_address, # CHANGE
        reply_to: campaign.reply_address
      })
  end
end
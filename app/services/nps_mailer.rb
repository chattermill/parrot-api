class NpsMailer
  NPS_TEMPLATE_ID = "tem_EyyDa2PuhbdiGZiwKLHCWS" #From sendwithus

  def initialize(campaign:)
    @client = SendWithUs::Api.new
    @campaign = campaign
  end

  def send_email(survey)
    client.send_email(
      NPS_TEMPLATE_ID,
      { name: survey.name, address: survey.email },
      data: {
        first_name: survey.name,
        company_name: campaign.company_name,
        company_url: campaign.company_url,
        background_color: campaign.background_color, 
        foreground_color: campaign.foreground_color,
        image_url: campaign.image_url,
        token: survey.token,
      },
      from: {
        name: campaign.from_name,
        address: campaign.from_address, # CHANGE
        reply_to: campaign.reply_address
      })
  end

  private

  attr_reader :client, :campaign
end
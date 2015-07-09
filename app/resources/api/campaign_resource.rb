module Api
  class CampaignResource < JSONAPI::Resource
    attributes :company_name, 
      :from_name, 
      :background_color, 
      :foreground_color, 
      :reply_address,
      :image_url,
      :from_address,
      :company_url,
      :nps_score,
      :percentage_promoters,
      :percentage_detractors,
      :percentage_passives,
      :created_at

    has_one :user

    
    def self.records(options = {})
      context = options[:context]
      context[:current_user].campaigns
    end
  end
end
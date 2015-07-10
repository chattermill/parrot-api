module Api
  class CampaignResource < JSONAPI::Resource
    NPS_FIELDS = [
      :nps_score,
      :percentage_promoters,
      :percentage_detractors,
      :percentage_passives
    ]

    attributes :company_name, 
      :from_name, 
      :background_color, 
      :foreground_color, 
      :reply_address,
      :image_url,
      :from_address,
      :company_url,
      :created_at,
      :nps_score,
      :percentage_promoters,
      :percentage_detractors,
      :percentage_passives

    has_one :user
    
    def self.records(options = {})
      context = options[:context]
      context[:current_user].campaigns
    end

    def self.creatable_fields(context)
      super - NPS_FIELDS
    end
  end
end
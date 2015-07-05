module Api
  class CampaignResource < JSONAPI::Resource
    attributes :company_name, :from_name, :background_color, :foreground_color, :reply_address

    has_one :user

    
    def self.records(options = {})
      context = options[:context]
      context[:current_user].campaigns
    end
  end
end
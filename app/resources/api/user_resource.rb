module Api
  class UserResource < JSONAPI::Resource
    attributes :email, :selected, :lists
    
    def self.updatable_fields(context)
      super - [:lists]
    end
   
    has_many :campaigns
  end
end
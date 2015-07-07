module Api
  class SurveyResponseResource < JSONAPI::Resource
    attributes :body, :score, :token

    def fetchable_fields
      super - [:token]
    end
  end
end
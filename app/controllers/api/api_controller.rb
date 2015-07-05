module Api
  class ApiController  < BaseController
    include JSONAPI::ActsAsResourceController
    before_action :ensure_valid_access_token!

    def context
      {current_user: current_user}
    end
  end
end

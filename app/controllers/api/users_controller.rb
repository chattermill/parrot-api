module Api
  class UsersController < ApiController
    include JSONAPI::ActsAsResourceController
    before_action :ensure_valid_access_token!
  end
end
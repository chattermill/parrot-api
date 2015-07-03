module Api
  class UsersController < BaseController
    before_action :ensure_valid_access_token!

    def show
      render json: user
    end

    private

    def user
      User.find(params[:id])
    end
  end
end
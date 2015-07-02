class Api::SessionsController < Api::BaseController
  respond_to :json

  skip_before_action :verify_authenticity_token

  def create
    if user
      render json: user.access_tokens.first_or_create
    else
      render json: { errors: user.errors },
        status: :unprocessable_entity
    end
  end

  private

  def mailchimp_authenticator
    MailchimpAuthenticator.new(auth_code: mailchimp_auth_code)
  end

  def user_factory
    UserFactory.new(authenticator: mailchimp_authenticator)
  end

  def user
    user_factory.find_or_create_user
  end

  def mailchimp_auth_code
    params.require(:code)
  end
end

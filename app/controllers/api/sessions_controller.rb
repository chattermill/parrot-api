class Api::SessionsController < Api::BaseController
  skip_before_action :verify_authenticity_token

  def create
    if user
      render json: access_token.as_json
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

  def access_token
    token = user.access_tokens.first_or_create
    token.slice(:access_token, :expires_at, :user_id).tap do |token_hash|
      token_hash[:expires_in] = token.expires_in
    end
  end
end

class MailchimpAuthenticator
  attr_reader :auth_data

  def initialize(auth_code:)
    @auth_code = auth_code
  end

  def user_params
    {
      email: auth_data[:metadata][:login]["email"],
      login: auth_data[:metadata][:login]["login_name"],
      account_name: auth_data[:metadata][:accountname],
      mailchimp_id: auth_data[:metadata][:user_id],
      mailchimp_auth_token: auth_data[:token_string],
      mailchimp_data_center: auth_data[:metadata][:dc]
    }
  end

  private

  attr_reader :auth_code

  def auth_data
    @auth_data ||= MailChimp3.oauth.complete_auth(
      auth_code,
      redirect_uri: 'http://127.0.0.1:4200'
    )
  end
end
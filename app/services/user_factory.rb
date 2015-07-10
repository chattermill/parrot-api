class UserFactory
  def initialize(authenticator:)
    @authenticator = authenticator
  end

  def find_or_create_user
    User.create_with(user_params).find_or_create_by(mailchimp_id: mailchimp_user_id)
  end

  private

  attr_reader :authenticator

  def mailchimp_user_id
    user_params[:mailchimp_id]
  end

  def user_params
    @user_params ||= authenticator.user_params
  end
end
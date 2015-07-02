class UserFactory
  def initialize(authenticator:)
    @authenticator = authenticator
  end

  def find_or_create_user
    return find_user if find_user 
    User.create(user_params)
  end

  private

  attr_reader :authenticator

  def mailchimp_user_id
    user_params[:mailchimp_id]
  end

  def find_user
    User.find_by_mailchimp_id(mailchimp_user_id)
  end

  def user_params
    @user_params ||= authenticator.user_params
  end
end
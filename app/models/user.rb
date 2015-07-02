class User < ActiveRecord::Base
  has_many :access_tokens, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def access_token
    access_tokens.active.first
  end
end

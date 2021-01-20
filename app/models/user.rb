class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email

  validates_presence_of :api_key
  validates_uniqueness_of :api_key

  validates_presence_of :password_confirmation

  def self.find_or_create(user)
    User.find_by(email: user[:email]) ||
    User.new(
      email: user[:email],
      password: user[:password],
      password_confirmation: user[:password_confirmation],
      api_key: SecureRandom.uuid
    )
  end
end

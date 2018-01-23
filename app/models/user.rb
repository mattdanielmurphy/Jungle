class User < ActiveRecord::Base
  validates :password, :password_confirmation, :email,
            :firstname, :lastname, presence: true
  validates :password, confirmation: true, length: { minimum: 10 }
  validates :email, uniqueness: { case_sensitive: false }
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)
    nil
  end
end

class User < ActiveRecord::Base
  validates :password, :password_confirmation, :email,
            :firstname, :lastname, presence: true
  validates :password, confirmation: true
  validates :email, uniqueness: { case_sensitive: false }
  has_secure_password
end

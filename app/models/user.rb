class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  has_many :categories, dependent: :destroy

  normalizes :email_address, with: ->(email) { email.strip.downcase }
end

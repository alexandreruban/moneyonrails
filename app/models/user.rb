class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :transactions, through: :accounts
  has_many :imports, dependent: :destroy

  normalizes :email_address, with: ->(email) { email.strip.downcase }
end

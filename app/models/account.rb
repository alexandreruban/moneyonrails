class Account < ApplicationRecord
  has_many :transactions, dependent: :destroy
  belongs_to :user

  validates :name, :balance, presence: true
end

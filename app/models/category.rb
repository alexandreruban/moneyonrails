class Category < ApplicationRecord
  has_many :transactions, dependent: :nullify

  belongs_to :user

  validates :name, presence: true

  def expense?
    !income?
  end
end

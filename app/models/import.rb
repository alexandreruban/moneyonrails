class Import < ApplicationRecord
  has_one_attached :file

  belongs_to :user

  validates :file, presence: true
  validate :file_is_csv, :file_size_is_small

  private

  def file_is_csv
    if file.attached? && file.content_type != "text/csv"
      errors.add(:file, "must be a CSV")
    end
  end

  def file_size_is_small
    if file.attached? && file.byte_size > 1.megabyte
      errors.add(:file, "must be less than 1Mb")
    end
  end
end

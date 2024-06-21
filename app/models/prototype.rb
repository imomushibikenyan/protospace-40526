class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true

  validate :image_attached_and_valid_content_type

  private

  def image_attached_and_valid_content_type
    if image.attached?
      unless image.content_type.in?(%w(image/jpeg image/png image/jpg))
        errors.add(:image, 'must be a JPEG, PNG, or JPG file')
      end
    else
      errors.add(:image, 'must be attached')
    end
  end
end

class Kit < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :scale, optional: true

  has_one_attached :box_art
  has_one_attached :preview
  has_one_attached :assembled_photo
  has_one_attached :packaging_photo

  has_one_attached :manual

  validates :article, :name_en, presence: true
  validates :year, allow_blank: true, numericality: { greater_than_or_equal_to: 2000, less_than_or_equal_to: Time.zone.today.year + 1 }

  default_scope { order(:article, :name_en) }

  def name(locale = :en)
    send("name_#{locale}")
  end
end

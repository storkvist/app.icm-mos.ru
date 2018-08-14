class Kit < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :scale, optional: true

  has_many_attached :images

  validates :article, :name_en, presence: true

  default_scope { order(:article, :name_en, :description_en) }

  def description(locale = I18n.locale)
    send("description_#{locale}")
  end

  def name(locale = I18n.locale)
    send("name_#{locale}")
  end
end

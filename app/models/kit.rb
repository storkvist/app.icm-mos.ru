class Kit < ApplicationRecord
  belongs_to :category
  belongs_to :scale

  validates :article, :category, :name, :scale, presence: true
end

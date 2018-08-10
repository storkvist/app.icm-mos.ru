class Category < ApplicationRecord
  has_many :kits, dependent: :destroy

  validates :name, presence: true
end

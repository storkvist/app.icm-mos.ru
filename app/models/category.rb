class Category < ApplicationRecord
  has_paper_trail

  has_many :kits, dependent: :destroy

  validates :name, presence: true
end

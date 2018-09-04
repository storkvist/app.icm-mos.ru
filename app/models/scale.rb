class Scale < ApplicationRecord
  has_paper_trail

  has_many :kits, dependent: :destroy

  validates :name, presence: true

  scope :order_by_name, -> { order('SUBSTRING(name, 3)::INT') }
end

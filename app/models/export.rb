class Export < ApplicationRecord
  belongs_to :user

  has_one_attached :zip

  has_many :exported_kits, dependent: :destroy
  has_many :kits, through: :exported_kits

  after_create_commit { PrepareExportJob.perform_later(self) }
end

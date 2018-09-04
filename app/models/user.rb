class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  has_paper_trail

  enum permission: { read_kits: 0, update_kits: 1, manage_all: 2 }

  validates :email, :name, presence: true
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  enum permission: { read_kits: 0, update_kits: 1, manage_all: 2 }

  validates :email, :name, presence: true
end

class Restaurant < ApplicationRecord
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :address, presence: true
  # validates :phone_number, format {regex to do}
  has_many :reviews, dependent: :destroy
end

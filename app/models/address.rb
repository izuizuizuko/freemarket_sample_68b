class Address < ApplicationRecord
  belongs_to :user
  validates :address_number, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :town, presence: true
end

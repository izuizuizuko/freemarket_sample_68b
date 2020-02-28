class Product < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many   :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name,        length: { maximum: 40 }, presence: true, on: :create
  validates :name,        length: { maximum: 40 }, presence: true
  validates :detail,      length: { maximum: 1000 }, presence: true, on: :create, on: :create
  validates :detail,      length: { maximum: 1000 }, presence: true, on: :create
  validates :category_id, presence: true, on: :create
  validates :category_id, presence: true
  validates :price,       presence: true, numericality: { only_integr: true,greater_than_or_equal_to: 270, less_than_or_equal_to: 9999999 }, on: :create
  validates :price,       presence: true, numericality: { only_integr: true,greater_than_or_equal_to: 270, less_than_or_equal_to: 9999999 }
  validates :condition,   presence: true, on: :create
  validates :condition,   presence: true
  validates :burden,      presence: true, on: :create
  validates :burden,      presence: true
  validates :days,        presence: true, on: :create
  validates :days,        presence: true
  validates_associated :images, presence: true
  validates :status,      presence: true
end

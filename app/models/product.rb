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
  validates :price,       presence: true, numericality: { only_integr: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, on: :create
  validates :price,       presence: true, numericality: { only_integr: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :condition,   presence: true, on: :create
  validates :condition,   presence: true
  validates :burden,      presence: true, on: :create
  validates :burden,      presence: true
  validates :days,        presence: true, on: :create
  validates :days,        presence: true
  validates_associated :images, presence: true





  
  
  # validates :status, presence: true


  enum burden: { "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2}, _prefix: true
  enum days: { "1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3},_prefix: true
  enum state: { 新品、未使用: 1, 未使用に近い: 2, 目立った傷や汚れなし: 3, やや傷や汚れあり: 4, 傷や汚れあり: 5, 全体的に状態が悪い: 6}, _prefix: true

end

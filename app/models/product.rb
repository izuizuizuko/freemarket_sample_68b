class Product < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many   :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, presence: true, profanity_filter: true
  validates :detail, presence: true, profanity_filter: true
  validates :category_id, presence: true
  validates :price, presence: true
  validates :condition, presence: true
  # validates :status, presence: true


  enum burden: { "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2}, _prefix: true
  enum days: { "1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3},_prefix: true
  enum state: { 新品、未使用: 1, 未使用に近い: 2, 目立った傷や汚れなし: 3, やや傷や汚れあり: 4, 傷や汚れあり: 5, 全体的に状態が悪い: 6}, _prefix: true

end

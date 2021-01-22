class Item < ApplicationRecord
  with_options presence:true do
    validetes :name
    validetes :explain
    validetes :category_id
    validetes :condition_id
    validetes :fee_id
    validetes :prefecture_id
    validetes :shipping_dur_id
    validetes :price
    validetes :user, foreign_key: true
  end

  belongs_to :user
  # has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :category_id, :condition_id, :fee_id, :prefecture_id, :shipping_dur_id

  validates :category_id, numericalty: {other_than:1}
  validates :condition_id, numericalty: {other_than:1}
  validates :fee_id, numericalty: {other_than:1}
  validates :prefecture_id, numericalty: {other_than:1}
  validates :shipping_dur_id, numericalty: {other_than:1}
end

# user の foreign_key: true の表記は合っているか？
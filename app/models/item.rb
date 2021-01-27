class Item < ApplicationRecord
  with_options presence:true do
    validates :image
    validates :name
    validates :explain
    with_options numericality:{other_than:1} do
      validates :category_id
      validates :condition_id
      validates :fee_id
      validates :prefecture_id
      validates :shipping_dur_id
    end
    validates :price, numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :user
  end

  belongs_to :user
  # has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :shipping_dur
  has_one_attached :image

end
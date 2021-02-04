class Buy

  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :zip_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase

  with_options presence:true do
    validates :user_id
    validates :item_id
    validates :zip_code, format:{ with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format:{ with: /\d{10,11}/, message: "is invalid. It can't include hyphen(-)"}, length: { minimum: 10, maximum:11 }
    validates :token
  end
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Ship.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
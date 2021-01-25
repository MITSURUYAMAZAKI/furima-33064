require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
# 必要な情報を適切に入力すると、商品の出品ができること
    it "必要な情報を適切に入力すると保存できる" do
      expect(@item).to be_valid
    end
# 商品画像を1枚つけることが必須であること
    it "imageが空であると登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
# 商品名が必須であること
    it "nameが空であると登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
# 商品の説明が必須であること
    it "explainが空であると登録できない" do
      @item.explain = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end
# カテゴリーの情報が必須であること
    it "category_idが空であると登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "category_idが1であると登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
# 商品の状態についての情報が必須であること
    it "condition_idが空であると登録できない" do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it "ccondition_idが1であると登録できない" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
# 配送料の負担についての情報が必須であること
    it "fee_idが空であると登録できない" do
      @item.fee_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee can't be blank")
    end
    it "fee_idが1であると登録できない" do
      @item.fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee must be other than 1")
    end
# 発送元の地域についての情報が必須であること
    it "prefecture_idが空であると登録できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "prefecture_idが1であると登録できない" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
# 発送までの日数についての情報が必須であること
    it "shipping_dur_idが空であると登録できない" do
      @item.shipping_dur_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping dur can't be blank")
    end
    it "shipping_dur_idが1であると登録できない" do
      @item.shipping_dur_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping dur must be other than 1")
    end
# 価格についての情報が必須であること
    it "priceが空であると登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
# 価格の範囲が、¥300~¥9,999,999の間であること
    it "price < ¥300 であると登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "price > ¥9,999,999 であると登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
# 販売価格は半角数字のみ保存可能であること
    it "priceが全角文字であると登録できない" do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end

# bundle exec rspec spec/models/item_spec.rb
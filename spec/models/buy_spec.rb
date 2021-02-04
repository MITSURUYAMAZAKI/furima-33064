require 'rails_helper'

RSpec.describe Buy, type: :model do
  describe 'クレジットカード情報・配送先情報の保存' do
    before do
      @buy = FactoryBot.build(:buy)
    end

    # 必要な情報を適切に入力すると、商品の購入ができること
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buy).to be_valid
    end

    it '建物名が空であっても保存できること' do
      @buy.building_name = ""
      expect(@buy).to be_valid
    end

    # 配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること
    it 'tokenが空であると保存できないこと' do
      @buy.token = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空であると保存できないこと' do
      @buy.zip_code = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Zip code can't be blank")
    end
    # # 郵便番号にはハイフンが必要であること（123-4567となる）
    it '郵便番号に"-"がないと保存できないこと' do
      @buy.zip_code = "4513654"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
    end
 
    it '都道府県が空であると保存できないこと' do
      @buy.prefecture_id = 1
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が空であると保存できないこと' do
      @buy.city = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include ("City can't be blank")
    end

    it '番地が空であると保存できないこと' do
      @buy.address = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空であると保存できないこと' do
      @buy.phone_number = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number can't be blank")
    end
    # # 電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）
    it '電話番号に"-"を含むと保存できないこと' do
      @buy.phone_number = "090-4444-1255"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number is invalid. It can't include hyphen(-)")
    end

  end
end
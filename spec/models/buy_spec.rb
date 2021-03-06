require 'rails_helper'

RSpec.describe Buy, type: :model do
  describe 'クレジットカード情報・配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      item.user.email = "test@test"
      item.save
      @buy = FactoryBot.build(:buy, user_id: user.id, item_id: item.id)
      sleep 1
    end

    context '商品購入ができる場合' do
      # 必要な情報を適切に入力すると、商品の購入ができること
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy).to be_valid
      end

      it '建物名が空であっても保存できること' do
        @buy.building_name = ""
        expect(@buy).to be_valid
      end
    end

    context '商品購入ができない場合' do
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
        expect(@buy.errors.full_messages).to include("Phone number is invalid. It can't include hyphen(-). And only number")
      end

      it '電話番号が12桁以上だと保存できないこと' do
        @buy.phone_number = "090444412550"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it '電話番号が9桁以下だと保存できないこと' do
        @buy.phone_number = "052395100"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end

      it '電話番号が英数混合であると保存できないこと' do
        @buy.phone_number = "052df0er41"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number is invalid. It can't include hyphen(-). And only number")
      end

      it 'user_idが空だと保存できないこと' do
        @buy.user_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @buy.item_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Item can't be blank")
      end

    end

  end
end
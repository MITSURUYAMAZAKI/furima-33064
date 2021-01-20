require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
# ニックネームが必須であること
    it "nick_nameが空であると登録できない" do
      @user.nick_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
# メールアドレスが必須であること
    it "emailが空であると登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
# メールアドレスが一意性であること
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Birthday can't be blank")
    end
# メールアドレスは、@を含む必要があること
    it "emailに「@」を含めないと登録できない" do
      @user.email = "testexample"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    # パスワードが必須であること
    it "パスワードが空であると登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
# パスワードは、6文字以上での入力が必須であること
    it "passwordが5文字以下であると登録できない" do
      @user.password = "1234x"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
# パスワードは、半角英数字混合での入力が必須であること
    it "アルファベットのみだと登録できない" do
      @user.password = "axcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 英数字混合で入力してください")
    end
    it "数字のみだと登録できない" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 英数字混合で入力してください")
    end
# パスワードは、確認用を含めて2回入力すること
    it "パスワード（確認用)が空であると登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
# パスワードとパスワード（確認用）、値の一致が必須であること
    it "パスワードとパスワード（確認用）が一致していなければ登録できない" do
      @user.password_confirmation = "15151c"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
# ユーザー本名は、名字と名前がそれぞれ必須であること
    it "苗字が空であると登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "名前が空であると登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
# ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること
    it "苗字が半角入力であると登録できない" do
      @user.family_name = "yamazaki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
    end
    it "名前が半角入力であると登録できない" do
      @user.first_name = "mitsuru"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end
      # ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること
    it "苗字のフリガナが空であると登録できない" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "名前のフリガナが空であると登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
# ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること
    it "苗字のフリガナが半角であると登録できない" do
    @user.family_name_kana = "ﾔﾏｻﾞｷ"
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters.")
  end
  it "名前のフリガナが半角であると登録できない" do
    @user.first_name_kana = "ﾐﾂﾙ"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
  end
# 生年月日が必須であること
    it "生年月日が空であると登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
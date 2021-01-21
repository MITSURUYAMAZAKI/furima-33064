class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format:{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "英数字混合で入力してください" }
  with_options presence:true do
    validates :nick_name
    with_options format:{ with: /\A[ぁ-んァ-ン一-龥々]/} do
      validates :family_name, format: {message: "is invalid. Input full-width characters." }
      validates :first_name, format: {message: "is invalid. Input full-width characters." }
    end
    with_options format:{ with: /\A[ァ-ヶー－]+\z/} do
      validates :family_name_kana, format: {message: "is invalid. Input full-width katakana characters." }
      validates :first_name_kana, format: {message: "is invalid. Input full-width katakana characters." }
    end
    validates :birthday
  end
end

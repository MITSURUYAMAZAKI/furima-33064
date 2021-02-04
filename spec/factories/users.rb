FactoryBot.define do
  factory :user do
    nick_name              {"test"}
    email                 {"test@example"}
    password              {"15151d"}
    password_confirmation {password}
    family_name {"山崎"}
    first_name  {"満"}
    family_name_kana  {"ヤマザキ"}
    first_name_kana {"ミツル"}
    birthday  {"1993-7-18"}
  end
end
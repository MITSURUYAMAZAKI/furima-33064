FactoryBot.define do
  factory :buy do
    token {"tok_abcdefghijk00000000000000000"}
    zip_code{'475-0012'}
    prefecture_id{2}
    city{'名古屋市名東区'}
    address{'青山１'}
    building_name{'シュタインズゲート1'}
    phone_number{'09054231269'}
  end
end

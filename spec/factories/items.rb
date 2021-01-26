FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/gyazoo.png'), filename: 'test_image.png')
    end
    name      {"新規登録とログイン"}
    explain   {"特にない"}
    category_id     {2}
    condition_id     {2}
    fee_id           {2}
    prefecture_id    {2}
    shipping_dur_id  {2}
    price          {900}
    association :user
  end
end

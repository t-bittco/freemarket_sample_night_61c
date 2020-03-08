FactoryBot.define do
  factory :image do
    name               {"pictweet.jpg"}
    gift_id            {"3"}
    association :gift
  end
end
FactoryBot.define do
  factory :image do
    name               {File.open("public/uploads/image/name/2/fullsizeoutput_1be7.jpg")}
    gift_id            {"3"}
    association :gift
  end
end
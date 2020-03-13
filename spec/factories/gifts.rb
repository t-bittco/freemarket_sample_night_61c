FactoryBot.define do
  factory :gift do
    name               {"abe"}
    discription        {"gmail.com"}
    state              {"good"}
    price              {"10000000"}
    shipping_charge    {"自分で払う"}
    how_to_ship        {"クロネコヤマト"}
    sender_region      {"愛知県"}
    days_to_ship       {"3〜4日"}
    category_id        {"446"}
    buyer_id           {"34"}
    listing_state      {"0"}
    user_id            {"3"}
  end
end
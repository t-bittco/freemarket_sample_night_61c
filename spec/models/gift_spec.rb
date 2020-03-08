require 'rails_helper'

describe Gift do
  describe '#create' do
    it "is valid with a name, discription, state, price, shipping_charge, how_to_ship, sender_region, days_to_ship, category_id, listing_state" do
      gift = build(:gift)
      expect(gift).to be_valid
    end
    it "is invalid without a name" do
      gift = build(:gift, name: nil)
      gift.valid?
      expect(gift.errors[:name]).to include("is too short (minimum is 1 character)")
    end
    it "is invalid with a name that has less than 40 charactors" do
      gift = build(:gift, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      gift.valid?
      expect(gift.errors[:name]).to include("is too long (maximum is 40 characters)")
    end
    it "is invalid without a discription" do
      gift = build(:gift, discription: nil)
      gift.valid?
      expect(gift.errors[:discription]).to include("can't be blank")
    end
    it "is invalid without a state" do
      gift = build(:gift, state: nil)
      gift.valid?
      expect(gift.errors[:state]).to include("can't be blank")
    end
    it "is invalid without a price" do
      gift = build(:gift, price: nil)
      gift.valid?
      expect(gift.errors[:price]).to include("can't be blank")
    end
    it "is invalid without a shipping_charge" do
      gift = build(:gift, shipping_charge: nil)
      gift.valid?
      expect(gift.errors[:shipping_charge]).to include("can't be blank")
    end
    it "is invalid without a how_to_ship" do
      gift = build(:gift, how_to_ship: nil)
      gift.valid?
      expect(gift.errors[:how_to_ship]).to include("can't be blank")
    end
    it "is invalid without a sender_region" do
      gift = build(:gift, sender_region: nil)
      gift.valid?
      expect(gift.errors[:sender_region]).to include("can't be blank")
    end
    it "is invalid without a days_to_ship" do
      gift = build(:gift, days_to_ship: nil)
      gift.valid?
      expect(gift.errors[:days_to_ship]).to include("can't be blank")
    end
    it "is invalid without a category_id" do
      gift = build(:gift, category_id: nil)
      gift.valid?
      expect(gift.errors[:category_id]).to include("can't be blank")
    end
    it "is invalid without a name" do
      gift = build(:gift, category_id: nil)
      gift.valid?
      expect(gift.errors[:category_id]).to include("can't be blank")
    end
    it "is invalid without listing_state" do
      gift = build(:gift, listing_state: nil)
      gift.valid?
      expect(gift.errors[:listing_state]).to include("can't be blank")
    end
  end
end
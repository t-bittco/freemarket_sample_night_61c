require 'rails_helper'

describe Image do
  it "is valid with a name, gift_id" do
    image = build(:image)
    expect(image).to be_valid
  end
  it "is invalid without a name" do
    image = build(:image, name: nil)
    image.valid?
    expect(image.errors[:name]).to include("can't be blank")
  end
end
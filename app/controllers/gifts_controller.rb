class GiftsController < ApplicationController
  def index
    @gift = Gift.includes(:images).order("created_at DESC")
  end
  def new
    @parents = Category.all.order("id ASC").limit(13)
    @category_parent_array = ["---"]
    @parents.each do |parent|
      @category_parent_array << parent.name
    end
    binding.pry
    @gift = Gift.new
    @gift.images.build
  end
  def create
    @gift = Gift.new(gift_params)
    @gift.images.new(gift_params)
    @gift.save
  end

  private
  def gift_params
    params.require(:gift).permit(:name, :discription, :shipping_charge, :how_to_ship, :sender_region, :days_to_ship, :state, :price, images_attributes: [:name])
  end
end
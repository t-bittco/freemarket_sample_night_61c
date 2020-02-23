class GiftsController < ApplicationController
  def index
  end
  def new
  end
  def create
    # binding.pry
    @gift = Gift.create!(gift_params)
    # @gift.images.build(gift_params)
    # @gift.build.shipping_method(gift_params)
    # @gift.create!
  end

  private
  def gift_params
    params.require(:gift).permit(:name, :discription, :category, :child_category, :grand_category, :state, :price)
  end
end
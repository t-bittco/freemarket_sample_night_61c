class GiftsController < ApplicationController
  def index
  end
  def new
    @parents = Category.all.order("id ASC").limit(13)
    @category_parent_array = ["---"]
    @parents.each do |parent|
      @category_parent_array << parent.name
    end
  end
  def create
    @gift = Gift.create(gift_params)
    # @gift.images.build(gift_params)
    # @gift.create!
  end

  private
  def gift_params
    params.require(:gift).permit(:name, :discription, :shipping_charge, :how_to_ship, :sender_region, :days_to_ship, :state, :price)
  end
end
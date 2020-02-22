class GiftsController < ApplicationController
  def index
  end
  def new
    @gift = Gift.new
    @gift.images.build
    @gift.build_shipping_method
  end
  def create
  end
  private 
    def gift_params
      params.require(:gift).permit(:name,images_attributes: [:gift_id],shipping_method_attributes: [:gift_id])
    end
end

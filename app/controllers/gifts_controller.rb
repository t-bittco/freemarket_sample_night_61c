class GiftsController < ApplicationController
  def index
  end
  def new
    @gift = Gift.new
    @gift.images.build
    @gift.shipping_methods.build
  end
  def create
  end
  private 
    def gift_params
      params.require(:gift).permit(:name,images_attributes: [:name],shipping_methods_attributes: [:gift_id])
    end
end

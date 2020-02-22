class GiftsController < ApplicationController
  def index
  end
  def new
    @gift = Gift.new
  end
  def create
  end
  private 
    def product_params
      params.require(:gift).permit(:name,images_attributes: [:name])
end
end

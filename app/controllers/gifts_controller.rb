class GiftsController < ApplicationController
  def index
    @gift = Gift.includes(:images).order("created_at DESC")
  end
  def new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    def get_category_children
      @category_children = Category.find_by(name: "#{params[:parent_name]}").children
    end
    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
    @gift = Gift.new
    @gift.images.new
  end
  def create
    @gift = Gift.create(gift_params)
    # images_params[:file].original_filename.each do |i|
    #   if i != nil
    #     @gift.images.create
    #   end
    # end
  end

  private
  def gift_params
    params.require(:gift).permit(:name, :discription, :shipping_charge, :how_to_ship, :sender_region, :days_to_ship, :state, :price, :category_id)
  end
  def images_params
    params.require(:gift).permit(images_attributes:[:name])
  end
end
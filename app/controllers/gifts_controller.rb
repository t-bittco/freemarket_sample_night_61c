class GiftsController < ApplicationController
  def index
    @gifts = Gift.includes(:images).order("created_at DESC")
  end
  def new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).limit(13).each do |parent|
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
    @gift = Gift.new(gift_params)
    if @gift.save
      render :create
    else
      render :new
    end
  end

  private
  def gift_params
    params.require(:gift).permit(:name, :discription, :shipping_charge, :how_to_ship, :sender_region, :days_to_ship, :state, :price, :category_id,images_attributes: [:name])
  end
end
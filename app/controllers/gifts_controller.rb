class GiftsController < ApplicationController

  before_action :get_gift, only: [:edit, :update, :show, :destroy]
  before_action :get_category_parents, only: [:new, :edit]
  before_action :get_brands, only: [:new, :edit]

  def index
    @gifts = Gift.includes(:images).order("created_at DESC")
  end
  def new
    if user_signed_in?
      @gift = Gift.new
      @gift.images.new
    else
      flash.now[:alert] = "ログインor新規登録行なってください"
      redirect_to :new_user_session
    end
  end
  def create
    @gift = Gift.new(gift_params)
    if @gift.save
      flash.now[:notice] = "商品の出品に成功しました"
      render :create
    else
      flash[:alert] = "入力に誤りがあります"
      redirect_to action: "new"
    end
  end
  def edit
    @category_children = Category.find(@gift.category_id).parent.parent.children
    @category_grandchildren = Category.find(@gift.category_id).parent.children
  end
  def update
    if @gift.update(gift_params)
      flash.now[:notice] = "出品商品の編集を完了しました"
      render :update
    else
      flash[:error] = '商品の出品に失敗しました'
      redirect_to action: "edit"
    end
  end
  def show
  end
  def destroy
    @gift.destroy
    redirect_to root_path
  end

  def get_category_parents
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end
  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}").children
  end
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  def get_brands
    @brands = [{name: "---", id: nil}]
    Brand.all.each do |b|
      @brands << {name: "#{b.name}", id: "#{b.id}"}
    end
  end

  private
  def gift_params
    params.require(:gift).permit(:name, :discription, :charge_id, :how_to_ship_id, :region_id, :days_id, :status_id, :price, :category_id, :listing_state, :user_id, :brand_id, images_attributes: [:name, :_destroy, :id])
  end
  def get_gift
    @gift = Gift.find(params[:id])
  end
  
end
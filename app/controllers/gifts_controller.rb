class GiftsController < ApplicationController
  def index
  end
  def new
    @parents = Category.all.order("id ASC").limit(13)
# 親セレクトボックスの初期値(配列)
    @category_parent_array = ["---------"]
    # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    # # itemに紐づいていいる孫カテゴリーの親である子カテゴリが属している子カテゴリーの一覧を配列で取得
    # @category_child_array = @gift.category.parent.parent.children
    # # itemに紐づいていいる孫カテゴリーが属している孫カテゴリーの一覧を配列で取得
    # @category_grandchild_array = @gift.category.parent.children
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
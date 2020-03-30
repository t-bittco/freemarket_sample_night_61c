class PurchaseController < ApplicationController
  require 'payjp'
  before_action :get_gift, only: [:index, :pay, :done]
  before_action :set_card, only: [:index, :pay]

  def index
    if @card.blank?
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @gift.price,
    :customer => @card.customer_id,
    :currency => 'jpy',
    )
    redirect_to action: "done", "gift_id": params[:gift_id], "buyer_id": params[:buyer_id]  #完了画面に移動
  end
  def done
    Gift.find(@gift.id).update(listing_state: 2, buyer_id: params[:buyer_id])
  end

  private
  def get_gift
    @gift = Gift.find(params[:gift_id])
  end  
  def set_card
    @card = Card.where(user_id: current_user.id).first
  end

end

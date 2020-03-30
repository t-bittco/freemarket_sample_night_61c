class MypageController < ApplicationController
  before_action :authenticate_user!

  def index
    # @products = Product.page(params[:page]).per(10)
  end

  def profile
  end

  def identification 
    @address= Address.find_by(user_id: current_user.id)  


  end

  # def update
  #   # @address= Address.find_by(user_id: current_user.id)  
  #   @address.update(address_params)
    
  #   if @address.update
  #     redirect_to controller: '/mypage', action: 'index'
  #   else
  #     # render "identification "
  #   end
    
  # end

  def card
    # @card = Card.find_by(user_id: current_user.id)
    # if @card.present?
    # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    # customer = Payjp::Customer.retrieve(@card.customer_id)
    # @default_card_information = customer.cards.retrieve(@card.card_id)
    # end
  end

  private
  def address_params
    
    params.require(:address).permit(:postal_code, :city, :prefecture, :street, :building).merge(user_id: current_user.id)
    
  end
end


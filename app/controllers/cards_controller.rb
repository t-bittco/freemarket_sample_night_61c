class CardsController < ApplicationController

  require "payjp"

  before_action :set_cards, only: [:index, :delete]

  def index
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    default_card_information = []
    @exp_mys = []
    @exp_last4 = []
    @cards.each_with_index do |card, i|
      customer = Payjp::Customer.retrieve(card.customer_id)
      default_card_information = customer.cards.retrieve(card.card_id)
      exp_month = default_card_information.exp_month.to_s
      exp_year = default_card_information.exp_year.to_s.slice(2,3)
      @exp_mys << "#{exp_month}/#{exp_year}"
      @exp_last4 << "#{default_card_information.last4}"
    end
  end

  def new
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params['payjp_token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params[:payjp_token],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    if @cards.blank?
      redirect_to action: "index"
    else
      card = @cards.find(params[:card_id])
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
      redirect_to action: "index"
    end
  end

  private
  def set_cards
    @cards = Card.where(user_id: current_user.id)
  end
end

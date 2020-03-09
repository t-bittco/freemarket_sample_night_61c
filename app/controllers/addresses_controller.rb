class AddressesController < ApplicationController
  before_action :authenticate_user!
  def step3
    @address = Address.new
    
  end

  def create
    @address = Address.create(address_params)
    
    if @address.save
      redirect_to controller: '/signup', action: 'done'
    else
      render "step3"
    end
    
    
    
  end

  def update
    @address= Address.find_by(user_id: current_user.id)
    if @address.update(address_params)
      redirect_to(mypage_identification_path,notice: '住所情報を変更しました')
    else
      redirect_to(mypage_identification_path,notice: '住所変更できませんでした')
    end
  end

  private
  def address_params
    
    params.require(:address).permit(:postal_code, :city, :prefecture, :street, :building).merge(user_id: current_user.id)
    
  end
end




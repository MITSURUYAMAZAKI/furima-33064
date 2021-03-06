class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :purchase_history_and_oneself_items

  def index
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(buy_params)
    if @buy.valid?
      pay_item
      @buy.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_params
    params.require(:buy).permit(:zip_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id:params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item =Item.find(params[:item_id])
  end

  def purchase_history_and_oneself_items
    if @item.purchase.present? || @item.user_id == current_user.id
      return redirect_to root_path
    end
  end

end
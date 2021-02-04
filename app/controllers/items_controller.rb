class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :sold_out, only:[:edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC").includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :condition_id, :fee_id, :prefecture_id, :shipping_dur_id, :price).merge(user_id: current_user.id)
  end

  def correct_user
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def  set_item
    @item = Item.find(params[:id])
  end

  def sold_out
    if @item.purchase.present?
      return redirect_to root_path
    end
  end

end
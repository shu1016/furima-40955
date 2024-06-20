class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_root, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
    
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:post_code, :region_id, :city, :address, :building, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    elsif Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

end

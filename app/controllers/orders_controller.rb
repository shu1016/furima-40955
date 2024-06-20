class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_root, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    @item = Item.find(order_params[:item_id])
    @price = @item.price
    if @order_delivery.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @price,
        card: @order_delivery.token,
        currency: 'jpy'
      )
      @order_delivery.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:post_code, :region_id, :city, :address, :building, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
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

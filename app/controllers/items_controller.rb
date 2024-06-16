class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :cost_id, :region_id, :period_id, :image).merge(user_id: current_user.id)
  end

end

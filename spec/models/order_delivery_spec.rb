require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_delivery = FactoryBot.build(:order_delivery,user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品購入機能' do
    context '購入が出来る' do
      it '全ての情報が揃っていれば購入できる' do
        expect(@order_delivery).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_delivery.building = ""
        expect(@order_delivery).to be_valid
      end
    end
    context '購入が出来ない' do
      it 'post_codeが空では購入できない' do
        @order_delivery.post_code = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが3桁-4桁でなければ購入できない' do
        @order_delivery.post_code = "1234567"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code is invalid")
      end
      it 'region_idが空では購入できない' do
        @order_delivery.region_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_delivery.city = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @order_delivery.address = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'tel_numberが空では購入できない' do
        @order_delivery.tel_number = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが11桁以上では購入できない' do
        @order_delivery.tel_number = "123456789123"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Tel number is invalid")
      end
      it 'tel_numberが10桁以下では購入できない' do
        @order_delivery.tel_number = "1234567"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Tel number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_delivery.user_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_delivery.item_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

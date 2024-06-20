class OrderDelivery
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :address, :building, :tel_number, :user_id, :item_id

  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :address
    validates :tel_number, format: {with: /\A[0-9]{10,11}\z/}
    validates :user_id
    validates :item_id
  end
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(post_code: post_code, region_id: region_id, city: city, address: address, building: building, tel_number: tel_number, order_id: order.id)
  end
end
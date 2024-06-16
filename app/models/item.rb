class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :Status
  belongs_to :cost
  belongs_to :region
  belongs_to :period


  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :period_id, numericality: { other_than: 1 , message: "can't be blank"}
end

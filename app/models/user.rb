class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  
  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥ー]/}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥ー]/}
  validates :family_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

end
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :addresses,dependent: :destroy

  validates :nickname, presence: true, length: { maximum: 15 },profanity_filter: true
  validates :f_name_kanji, presence: true, length: { maximum: 15 }, format: { with: /\A[一-龥]+\z/ }
  validates :l_name_kanji, presence: true, length: { maximum: 15 }, format: { with: /\A[一-龥]+\z/ }
  validates :f_name_kana, presence: true, length: { maximum: 15 }, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :l_name_kana, presence: true, length: { maximum: 15 }, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :birth_day, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
  validates :password,presence: true
  validates :password_confirmation,presence: true

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

  validates :telephone, presence: true, length: { maximum: 11 },format: { with: VALID_PHONE_REGEX }
  
end
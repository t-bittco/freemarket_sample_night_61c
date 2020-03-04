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
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable,
        #  :omniauthable, omniauth_providers: %i[facebook google_oauth2]
end

# has_many :sns_credentials, dependent: :destroy
  # has_many :products,dependent: :destroy
  # has_many :cards,dependent: :destroy
  # has_many :addresses,dependent: :destroy
  # has_many :comments 

  
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
         
  has_many :addresses,dependent: :destroy
  has_many :sns_credentials, dependent: :destroy
  # has_many :cards,dependent: :destroy
  # has_many :gifts,dependent: :destroy

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

  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
          password: Devise.friendly_token.first(7)
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
    end

   def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        password: Devise.friendly_token.first(7)
      )
    end
    return {user: user}
   end

   def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end
  
end
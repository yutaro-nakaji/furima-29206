class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, format: { with: EMAIL_REGEX }
  PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]+\z/.freeze
  validates :password, presence: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }
  validates_confirmation_of :password
  NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze
  validates :first_name, presence: true, format: { with: NAME_REGEX }
  validates :last_name, presence: true, format: { with: NAME_REGEX }
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :first_name_kana, presence: true, format: { with: NAME_KANA_REGEX }
  validates :last_name_kana, presence: true, format: { with: NAME_KANA_REGEX }
  validates :birthday, presence: true
end

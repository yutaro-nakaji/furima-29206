class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates_confirmation_of :password
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字で入力して下さい。' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: '全角カタカナで入力して下さい。' } do
    validates :first_name_kana
    validates :last_name_kana
  end
  validates :birthday, presence: true
end

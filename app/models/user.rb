class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :verifications
  has_many :reservations

  with_options presence: true do
    validates :nickname
    validates :user_birth_date
    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
     validates :full_name
    end
    with_options format: {with: /\A[ァ-ヶー]+\z/} do
      validates :full_name_kana
     end
  end

end

class Reservation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :staff
  belongs_to :user

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "はハイフンを含めた7桁の数字で入力してください"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :addresses
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "は無効の数字です"} 
    validates :staff_id
    validates :user_id
  end

  validates_time :start_time, between: ['9:00am', '6:00pm']

  validates :start_time, uniqueness: { message: 'は他のユーザーが予約しています' }
  validate :date_before_start
  def date_before_start
    errors.add(:start_time, "は過去の日付を選択できません") if start_time < Date.today
  end

end

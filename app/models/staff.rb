class Staff < ApplicationRecord
  has_one_attached :image

  has_many :verifications
  has_many :reservations
  has_one :staff_order


  with_options presence: true do
    validates :image
    validates :name
    validates :comment
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/,
      message: "は半角数字のみ使えます" }
    validates :history, format: {with: /\A[0-9]+\z/, message: "は半角数字で入力してください"}
    validates :hobby
  end

  def self.search(search)
    if search
      Staff.where(['name LIKE ?', "%#{search}%"])
    else
      Staff.all
    end
  end

end

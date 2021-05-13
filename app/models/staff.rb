class Staff < ApplicationRecord
  has_one_attached :image

  has_many :verifications
  has_many :reservations
  has_one :staff_order


  with_options presence: true do
    validates :image
    validates :name
    validates :comment
    validates :history
  end

  def self.search(search)
    if search
      Staff.where(['name LIKE ?', "%#{search}%"])
    else
      Staff.all
    end
  end

end

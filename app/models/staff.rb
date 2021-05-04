class Staff < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :comment
    validates :history
  end
end

class Cat < ActiveRecord::Base

  validates :color, inclusion: CAT_COLORS
  validates :sex, inclusion: %w(M F)

  CAT_COLORS = %w(black white orange brown)

  validates(
  :birth_date,
  :color,
  :name,
  :sex,
  presence: true

  
end

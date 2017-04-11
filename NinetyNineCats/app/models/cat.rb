class Cat < ActiveRecord::Base

  include ActionView::Helpers::DateHelper
  CAT_COLORS = %w(black white orange brown)

  validates :color, inclusion: CAT_COLORS
  validates :sex, inclusion: %w(M F)


  validates(
  :birth_date,
  :color,
  :name,
  :sex,
  presence: true
  )

  def age
    time_ago_in_words(birth_date)
  end

end

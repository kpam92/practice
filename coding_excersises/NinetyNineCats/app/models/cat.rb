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

  has_many :cat_rental_requests,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: 'CatRentalRequest',
  dependent: :destroy

  def age
    time_ago_in_words(birth_date)
  end

end

class CatRentalRequest < ActiveRecord::Base

  validates :status, inclusion: %w(PENDING APPROVED DENIED)

  validates :cat_id, :start_date, :end_date, :status, presence: true

  belongs_to :cat,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: 'Cat'

  def overlapping_requests
    CatRentalRequest
    .where.not(id: self.id)
    .where(cat_id: cat_id)
    .where(<<-SQL, start_date: start_date, end_date: end_date)
       NOT( (start_date > :end_date) OR (end_date < :start_date) )
    SQL
  end

  def overlapping_approved_requests
    overlapping_requests.where("Status = 'APPROVED'")
  end

  def does_not_overlap_approved_request
    return if self.denied?

    unless overlapping_approved_requests.empty?
      errors[:base] << "Request conflicts with existing approved request"
    end
  end

end

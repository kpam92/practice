class CatRentalRequest < ActiveRecord::Base

  validates :status, inclusion: %w(PENDING APPROVED DENIED)
end

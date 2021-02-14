class Reservation < ApplicationRecord
  belongs_to :guest, class_name: "User"

  validate :start_must_be_before_end_date

  # Confirm start date is before end date
  def start_must_be_before_end_date
    return unless start_date and end_date
    errors.add(:start_date, "must be before end time") unless start_date < end_date
  end

  # Get duration of reservation
  def duration
    (self.end_date.to_i/60/60/24) - (self.start_date.to_i/60/60/24)
  end
  
end

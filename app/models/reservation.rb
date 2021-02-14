class Reservation < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :listing

  # Confirm start date is before end date
  validate :start_must_be_before_end_date

  def start_must_be_before_end_date
    return unless start_date and end_date
    errors.add(:start_date, "must be before end date") unless start_date < end_date
  end

  # Confirm booking doesn't overlap with any others
  validate :validate_other_booking_overlap

  def period
    start_date..end_date
  end

  private

  def validate_other_booking_overlap
    other_bookings = Reservation.all
    is_overlapping = other_bookings.any? do |other_booking|
      period.overlaps?(other_booking.period)
    end
    errors.add(:overlaps_with_other) if is_overlapping
  end

  # Get duration of reservation
  def duration
    (self.end_date.to_i/60/60/24) - (self.start_date.to_i/60/60/24)
  end

end
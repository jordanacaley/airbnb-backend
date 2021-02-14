class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Please enter a valid email address" }
  validates :phone_number,
    presence: true,
    uniqueness: true,
    format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "PLease enter a valid French number" }
  has_many :reservations, foreign_key: 'guest_id', class_name: "Reservation"
  has_many :listings, foreign_key: 'admin_id', class_name: "Listing"
end

class Listing < ApplicationRecord
  validates :available_beds,
    presence: true,
    numericality: { greater_than: 0 }
  validates :price,
    presence: true,
    numericality: { greater_than: 0 }
  validates :description,
    presence: true,
    length: { minimum: 140 }
  validates :has_wifi,
    presence: true
  validates :welcome_message,
    presence: true
  belongs_to :admin, class_name: "User"
  has_many :reservations
  belongs_to :city
end

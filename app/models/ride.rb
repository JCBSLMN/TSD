class Ride < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :purge
  validates :location, presence: true
  validates :first_name, presence: true, length: {in: 2..15}
  validates :last_name, presence: true, length: {in: 2..15}
  validates :email, email: true
  validates :details, presence: true
  validates :cost, presence: true, numericality: true
  validates :duration, presence: true, numericality: true
  validates :image, presence: true
  
end


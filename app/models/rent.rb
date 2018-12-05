class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user, :book, :start, :end, presence: true
end

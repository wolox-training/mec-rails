class Book < ApplicationRecord
  validates :genre, :author, :image, :title, :editor, :year, presence: true
  has_one :rents, dependent: :nullify
end

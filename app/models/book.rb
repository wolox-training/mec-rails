class Book < ApplicationRecord
  validates :genre, :author, :image, :title, :editor, :year, presence: true
  has_one :rent, dependent: :nullify
end

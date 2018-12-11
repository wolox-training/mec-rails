class BookSuggestion < ApplicationRecord
  validates :synopsis, :price, :genre, :author, :image, :title, :editor, :year, presence: true
  belongs_to :user
end

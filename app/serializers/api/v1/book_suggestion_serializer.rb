module Api
  module V1
    class BookSuggestionSerializer < ActiveModel::Serializer
      attributes :synopsis, :price, :genre, :author, :image, :title,
                 :editor, :year
      belongs_to :user
    end
  end
end
